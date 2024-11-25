import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class ConfigurationService {
  constructor(private readonly databaseService: DatabaseService) {}

  create(createConfigurationDto: Prisma.ConfigurationCreateInput) {
    return this.databaseService.configuration.create({ data: createConfigurationDto });
  }

  findAll() {
    return this.databaseService.configuration.findMany();
  }

  findOne(id: number) {
    return `This action returns a #${id} configuration`;
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
