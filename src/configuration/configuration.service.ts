import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { ConfigurationEdit, ContactEdit } from 'src/pages/entities/constant';

@Injectable()
export class ConfigurationService {
  constructor(private readonly databaseService: DatabaseService) {}

  create(createConfigurationDto: Prisma.ConfigurationCreateInput) {
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

  update(id: number, updateConfigurationDto: Prisma.ConfigurationUpdateInput) {
    return this.databaseService.configuration.update({
      where: {
        id: id,
      },
      data: {
        ...updateConfigurationDto,
      },
    });
  }

  remove(id: number) {
    return this.databaseService.configuration.delete({ where: { id: id } });
  }
}
