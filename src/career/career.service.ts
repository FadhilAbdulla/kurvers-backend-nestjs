import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class CareerService {
  constructor(private readonly databaseService: DatabaseService) {}

  create(createCareerDto: Prisma.JobCreateInput) {
    return this.databaseService.job.create({ data: createCareerDto });
  }
  async changeStatus(id: number) {
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

  update(id: number, updateCareerDto: Prisma.JobUpdateInput) {
    return this.databaseService.job.update({
      where: {
        id: id,
      },
      data: {
        ...updateCareerDto,
      },
    });
  }

  remove(id: number) {
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
