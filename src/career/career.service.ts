import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class CareerService {
  constructor(private readonly databaseService: DatabaseService) {}

  async create(createCareerDto: Prisma.JobCreateInput) {
    await this.databaseService.activity_log.create({ data: { activity: 'career', action: 'created', userId: 1 } });
    return this.databaseService.job.create({ data: createCareerDto });
  }
  async changeStatus(id: number) {
    await this.databaseService.activity_log.create({ data: { activity: 'career', action: 'status changed', userId: 1 } });

    const currentState = await this.databaseService.job.findUnique({
      where: { id },
      select: { isActive: true }, // Select only the 'isActive' field
    });

    if (!currentState) {
      throw new Error('Job not found');
    }

    // Update the 'isActive' field to its opposite value
    return this.databaseService.job.update({
      where: { id },
      data: {
        isActive: !currentState.isActive, // Toggle the 'isActive' field
      },
    });
  }

  findAll() {
    return this.databaseService.job.findMany({
      where: {
        isDeleted: false, // Add the condition to filter records where isDeleted is false
      },
    });
  }

  findOne(id: number) {
    return this.databaseService.job.findFirst({ where: { id: id } });
  }

  async update(id: number, updateCareerDto: Prisma.JobUpdateInput) {
    await this.databaseService.activity_log.create({ data: { activity: 'career', action: 'updated', userId: 1 } });
    return this.databaseService.job.update({
      where: {
        id: id,
      },
      data: {
        ...updateCareerDto,
      },
    });
  }

  async remove(id: number) {
    await this.databaseService.activity_log.create({ data: { activity: 'career', action: 'removed', userId: 1 } });
    return this.databaseService.job.update({
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
