import { Injectable } from '@nestjs/common';
// import { CreateBannerDto } from './dto/create-banner.dto';
// import { UpdateBannerDto } from './dto/update-banner.dto';
import { DatabaseService } from 'src/database/database.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class BannerService {
  constructor(private readonly databaseService: DatabaseService) {}

  async create(createBannerDto: Prisma.BannerCreateInput) {
    await this.databaseService.activity_log.create({ data: { activity: 'banner', action: 'created', userId: 1 } });
    return this.databaseService.banner.create({ data: createBannerDto });
  }

  findAll() {
    return this.databaseService.banner.findMany({
      where: {
        isDeleted: false, // Add the condition to filter records where isDeleted is false
      },
    });
  }

  findOne(id: number) {
    return `This action returns a #${id} banner`;
  }

  async update(id: number, updateBannerDto: Prisma.BannerUpdateInput) {
    await this.databaseService.activity_log.create({ data: { activity: 'banner', action: 'updated', userId: 1 } });
    return this.databaseService.banner.update({
      where: {
        id: id,
      },
      data: {
        ...updateBannerDto,
      },
    });
  }

  async remove(id: number) {
    await this.databaseService.activity_log.create({ data: { activity: 'banner', action: 'removed', userId: 1 } });
    return this.databaseService.banner.update({
      where: {
        id: id,
      },
      data: {
        isDeleted: true,
      },
    });
  }
}
