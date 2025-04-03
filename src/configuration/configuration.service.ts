import { HttpException, Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { ConfigurationEdit, ContactEdit } from 'src/pages/entities/constant';
import { Sitevariables, fillDefaults } from './entities/constants';

@Injectable()
export class ConfigurationService {
  constructor(private readonly databaseService: DatabaseService) { }

  async create(createConfigurationDto: Prisma.ConfigurationCreateInput) {
    await this.databaseService.logActivity('General Data', 'created');
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

  async findOne(id: string) {
    const res = await this.databaseService.configuration.findFirst({ where: { label: id } });
    if (!res) {
      throw new HttpException('Invalid Configuration ID', 400);
    }
    else {
      res.value = JSON.parse(res.value);
      return res;
    }
  }

  async update(label: string, Data: any) {
    await this.databaseService.logActivity('General Data', 'updated');
    if (!Sitevariables[label]) {
      console.log(label);

      throw new HttpException('Invalid Configuration ID', 400);
    }
    const updateData = fillDefaults(Data || {}, Sitevariables[label])
    const updateDataString = { value: JSON.stringify(updateData) }

    return this.databaseService.configuration.upsert({
      where: {
        label: label,
      },
      update: updateDataString,
      create: {
        label: label,
        ...updateDataString,
      },
    });

  }

  async remove(id: number) {
    await this.databaseService.logActivity('General Data', 'removed');

    return this.databaseService.configuration.delete({ where: { id: id } });
  }

}
