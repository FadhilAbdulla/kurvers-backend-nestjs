import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { ConfigurationEdit, ContactEdit } from 'src/pages/entities/constant';

@Injectable()
export class ConfigurationService {
  constructor(private readonly databaseService: DatabaseService) {}

  async create(createConfigurationDto: Prisma.ConfigurationCreateInput) {
    await this.databaseService.activity_log.create({ data: { activity: 'General Data', action: 'created', userId: 1 } });
    return this.databaseService.configuration.create({ data: createConfigurationDto });
  }

  findAll() {
    return this.databaseService.configuration.findMany({
      where: {
        label: {
          in: ConfigurationEdit,
        },
      },
    });
  }

  findLogs() {
    return this.databaseService.activity_log.findMany({
      include: { user: true },
      orderBy: {
        dateAdded: 'desc',
      },
    });
  }

  findContactUS() {
    return this.databaseService.configuration.findMany({
      where: {
        label: {
          in: ContactEdit,
        },
      },
    });
  }

  findOne(id: string) {
    return this.databaseService.configuration.findFirst({ where: { label: id } });
  }

  async update(id: number, updateConfigurationDto: Prisma.ConfigurationUpdateInput) {
    await this.databaseService.activity_log.create({ data: { activity: 'General Data', action: 'updated', userId: 1 } });

    return this.databaseService.configuration.update({
      where: {
        id: id,
      },
      data: {
        ...updateConfigurationDto,
      },
    });
  }

  async remove(id: number) {
    await this.databaseService.activity_log.create({ data: { activity: 'General Data', action: 'removed', userId: 1 } });

    return this.databaseService.configuration.delete({ where: { id: id } });
  }
}
