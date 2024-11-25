import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CareerapplyService } from './careerapply.service';
import { Prisma } from '@prisma/client';
// import { CreateCareerapplyDto } from './dto/create-careerapply.dto';
// import { UpdateCareerapplyDto } from './dto/update-careerapply.dto';

@Controller('careerapply')
export class CareerapplyController {
  constructor(private readonly careerapplyService: CareerapplyService) {}

  @Post()
  create(@Body() createCareerapplyDto: Prisma.JobApplyCreateInput) {
    console.log(createCareerapplyDto, 'here');

    return this.careerapplyService.create(createCareerapplyDto);
  }

  @Get()
  findAll() {
    return this.careerapplyService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.careerapplyService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateCareerapplyDto: Prisma.JobApplyUpdateInput) {
    return this.careerapplyService.update(+id, updateCareerapplyDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.careerapplyService.remove(+id);
  }
}
