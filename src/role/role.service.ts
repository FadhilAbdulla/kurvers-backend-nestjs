import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class RoleService {
  constructor(private readonly databaseService: DatabaseService) {}

  create(createRoleDto: Prisma.RoleCreateInput) {
    return this.databaseService.role.create({ data: createRoleDto });
  }

  async findAll() {
    return this.databaseService.role.findMany();
  }

  findOne(id: number) {
    return `This action returns a #${id} role`;
  }

  update(id: number, updateRoleDto: Prisma.RoleUpdateInput) {
    return `This action updates a #${id} role`;
  }

  remove(id: number) {
    return `This action removes a #${id} role`;
  }
}
