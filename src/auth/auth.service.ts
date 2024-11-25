import { ForbiddenException, Injectable } from '@nestjs/common';
import { LoginDTO } from './dto/auth.dto';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class AuthService {
  constructor(private readonly databaseSevice: DatabaseService) {}

  async login(UserLoginDTO: LoginDTO) {
    const user = await this.databaseSevice.user.findUnique({
      where: { email: UserLoginDTO.email },
    });

    if (!user) {
      throw new ForbiddenException('Sorry, This email is not registered with us');
    }

    // const isPasswordValid = await bcrypt.compare(UserLoginDTO.password, user.password);
    console.log(user);
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

    return {
      message: 'Login successful',
      user: {
        id: user.id,
        name: user.name,
        email: user.email,
      },
    };
  }
}
