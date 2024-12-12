import { Injectable } from '@nestjs/common';
// import { CreateBannerDto } from './dto/create-banner.dto';
// import { UpdateBannerDto } from './dto/update-banner.dto';
import { DatabaseService } from 'src/database/database.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class BannerService {
  constructor(private readonly databaseService: DatabaseService) {}

  async create(createBannerDto: Prisma.BannerCreateInput) {
    await this.databaseService.logActivity('Banner', 'created');
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
    await this.databaseService.logActivity('Banner', 'updated');
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
    await this.databaseService.logActivity('Banner', 'removed');
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
