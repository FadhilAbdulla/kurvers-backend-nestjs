import { Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';
import { PermissionType, Prisma } from '@prisma/client';
import { UpdatePermissionDto } from './dto/update-permission.dto';

@Injectable()
export class PermissionService {
  constructor(private readonly databaseService: DatabaseService) {}

  create(createPermissionDto: Prisma.PermissionCreateInput) {
    return this.databaseService.permission.create({ data: createPermissionDto });
  }

  findAll() {
    return this.databaseService.permission.findMany();
  }

  async findOne(id: number) {
    const PermissionLIst = await this.databaseService.permission.findMany();
    const assignedPermissions = await this.databaseService.role_Permission.findMany({
      where: { roleId: id },
      include: {
        Permission: true, // Include related Permission data
        // Role: true,       // Include related Role data if needed
      },
    });

    const permRes = PermissionLIst.map((perm) => {
      // Create a fresh response object for each permission
      const res = {
        PermissionName: perm.PermissionName,
        WRITE: false,
        READ: false,
        UPDATE: false,
        DELETE: false,
      };

      assignedPermissions.map((each) => {
        if (perm.id === each.permissionId) {
          res[each.type] = true;
        }
      });

      return res;
    });

    // {
    //   PermissionName: "Inventory",
    //   create: true,
    //   read: true,
    //   update: true,
    //   delete: true,
    // },

    return { Permission: permRes };
  }

  async update(id: number, updatePermissionDto: UpdatePermissionDto) {
    await this.databaseService.logActivity('Permission', 'updated');

    updatePermissionDto.permission.map(async (item) => {
      const permData = await this.databaseService.permission.findFirst({ where: { PermissionName: item.PermissionName } });
      const AssignedRoles = await this.databaseService.role_Permission.findMany({ where: { permissionId: permData.id, roleId: id } });

      const permissionTypes = AssignedRoles.reduce((acc, item) => {
        acc[item.type] = item.id;
        return acc;
      }, {});
      console.log(permissionTypes);

      const operations = ['WRITE', 'READ', 'UPDATE', 'DELETE'] as const;

      operations.map(async (oper) => {
        if (item[oper] && !permissionTypes[oper]) {
          // Create new permission
          console.log(oper, 'create', id);

          await this.databaseService.role_Permission.create({
            data: {
              Role: { connect: { id } }, // Connect existing Role by ID
              Permission: { connect: { id: permData.id } }, // Connect existing Permission by ID
              type: oper as PermissionType, // Ensure `oper` matches the enum
            },
          });
        } else if (!item[oper] && permissionTypes[oper]) {
          // Remove permission if it exists and is no longer needed
          console.log(oper, 'delete', id);
          await this.databaseService.role_Permission.deleteMany({
            where: {
              roleId: id,
              permissionId: permData.id,
              type: oper as PermissionType,
            },
          });
        }
      });
    });
    return 'update';
  }

  async remove(id: string) {
    await this.databaseService.logActivity('Permission', 'removed');

    return this.databaseService.permission.delete({ where: { PermissionName: id } });
  }
}
