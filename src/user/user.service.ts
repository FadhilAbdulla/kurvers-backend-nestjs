import { ForbiddenException, Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { DatabaseService } from 'src/database/database.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class UserService {
  constructor(private readonly databaseService: DatabaseService) {}

  async create(user: CreateUserDto) {
    await this.databaseService.activity_log.create({ data: { activity: 'User', action: 'created', userId: 1 } });
    if (user.password !== user.confirmPassword) {
      throw new ForbiddenException('Passwords do not match');
    }

    const { confirmPassword, ...userData } = user;

    return this.databaseService.user.create({ data: userData });
  }

  findAll() {
    return this.databaseService.user.findMany({
      where: {
        isDeleted: false, // Add the condition to filter records where isDeleted is false
      },
      include: {
        role: {
          select: {
            RoleName: true, // Fetch only the role name
          },
        },
      },
    });
  }

  findOne(id: number) {
    return `This action returns a #${id} user`;
  }

  async update(id: number, updateUserDto: Prisma.UserUpdateInput) {
    await this.databaseService.activity_log.create({ data: { activity: 'User', action: 'updated', userId: 1 } });
    return this.databaseService.user.update({
      where: {
        id: id,
      },
      data: {
        ...updateUserDto,
      },
    });
  }

  async remove(id: number) {
    await this.databaseService.activity_log.create({ data: { activity: 'User', action: 'removed', userId: 1 } });
    return this.databaseService.user.update({
      where: {
        id: id,
      },
      data: {
        isDeleted: true,
      },
      // return `This action removes a #${id} user`;
    });
  }
}
