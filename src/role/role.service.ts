import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class RoleService {
  constructor(private readonly databaseService: DatabaseService) {}

  async create(createRoleDto: Prisma.RoleCreateInput) {
    await this.databaseService.logActivity('Role', 'created');

    return this.databaseService.role.create({ data: createRoleDto });
  }

  async findAll() {
    return this.databaseService.role.findMany({ where: { isDeleted: false } });
  }

  findOne(id: number) {
    return `This action returns a #${id} role`;
  }

  update(id: number, updateRoleDto: Prisma.RoleUpdateInput) {
    return `This action updates a #${id} role`;
  }

  async remove(id: number) {
    await this.databaseService.logActivity('Role', 'removed');
    return this.databaseService.role.update({
      where: {
        id: id,
      },
      data: {
        isDeleted: true,
      },
    });
  }
}
