import { ForbiddenException, Injectable } from '@nestjs/common';
import { LoginDTO } from './dto/auth.dto';
import { DatabaseService } from 'src/database/database.service';
import { v4 as uuid } from 'uuid';

const access_control = ['job_application', 'career', 'admin', 'product_range', 'kurvers_valves', 'contact_us', "home", "about", "turnkey", "footer", "elements", "quality"];

const FetchPermissionList = (permissionsList) => {
  return permissionsList.reduce((acc, { type, Permission: { PermissionName } }) => {
    // Check if PermissionName is in allowed list
    if (access_control.includes(PermissionName)) {
      // Initialize the key if it doesn't exist
      if (!acc[PermissionName]) {
        acc[PermissionName] = [];
      }
      // Add the permission type to the array
      acc[PermissionName].push(type);
    }
    return acc;
  }, {});
};
const FullPermission = () => {
  const res = {};
  access_control.map((item) => (res[item] = ['WRITE', 'READ', 'UPDATE', 'DELETE']));
  return res;
};

const Admin = { email: 'admin@pmits.com', password: 'root' };

@Injectable()
export class AuthService {
  constructor(private readonly databaseSevice: DatabaseService) { }

  async login(UserLoginDTO: LoginDTO) {
    const user = await this.databaseSevice.user.findUnique({
      where: { email: UserLoginDTO.email },
      include: { role: true },
    });

    if (Admin.email === UserLoginDTO.email && Admin.password === UserLoginDTO.password) {
      return {
        message: 'Login successful',
        user: {
          UserName: 'Site Admin',
          UserId: 0,
          UserRole: 'Site Root',
          AuthToken: `${Date.now()}-${uuid()}`,
          Permission: FullPermission(),
        },
      };
    }

    if (!user) {
      throw new ForbiddenException('Sorry, This email is not registered with us');
    }

    // const isPasswordValid = await bcrypt.compare(UserLoginDTO.password, user.password);
    // console.log(user);
    const isPasswordValid = UserLoginDTO.password === user.password;
    if (!isPasswordValid) {
      throw new ForbiddenException('Invalid email or password');
    }

    await this.databaseSevice.user.update({
      where: { id: user.id },
      data: {
        lastLogin: new Date(),
      },
    });

    const Permissions = await this.databaseSevice.role_Permission.findMany({
      where: { roleId: user.roleId },
      include: {
        Permission: true, // Include related Permission data
        // Role: true,       // Include related Role data if needed
      },
    });

    // console.log(Permissions);
    await this.databaseSevice.activity_log.create({ data: { activity: 'authentication', action: 'login', userId: user.id } });

    return {
      message: 'Login successful',
      user: {
        UserName: user?.name,
        UserId: user?.id,
        UserRole: user?.role?.RoleName,
        AuthToken: `${Date.now()}-${uuid()}`,
        Permission: FetchPermissionList(Permissions),
      },
    };
  }
}
