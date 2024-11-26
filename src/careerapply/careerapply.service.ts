import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class CareerapplyService {
  constructor(private readonly databaseService: DatabaseService) {}

  create(createCareerapplyDto: Prisma.JobApplyCreateInput) {
    return this.databaseService.jobApply.create({ data: createCareerapplyDto });
  }

  findAll() {
    return this.databaseService.jobApply.findMany({
      include: {
        job: {
          select: {
            title: true, // Include the job title
            location: true, // Include job location (optional)
            type: true, // Include job type (optional)
          },
        },
      },
      orderBy: {
        appliedAt: 'desc', // Order by the 'appliedAt' field in descending order (latest first)
      },
    });
  }

  findOne(id: number) {
    return `This action returns a #${id} careerapply`;
  }

  update(id: number, updateCareerapplyDto: Prisma.JobApplyUpdateInput) {
    return `This action updates a #${id} careerapply`;
  }

  remove(id: number) {
    return `This action removes a #${id} careerapply`;
  }
}
