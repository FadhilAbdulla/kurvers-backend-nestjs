import { Controller, Get, Post, Body, Patch, Param, Delete, ParseIntPipe } from '@nestjs/common';
import { CareerService } from './career.service';
import { Prisma } from '@prisma/client';

@Controller('careerapi')
export class CareerController {
  constructor(private readonly careerService: CareerService) {}

  @Post()
  create(@Body() createCareerDto: Prisma.JobCreateInput) {
    return this.careerService.create(createCareerDto);
  }

  @Post('status/:id')
  changeStatus(@Param('id', ParseIntPipe) id: number) {
    return this.careerService.changeStatus(id);
  }

  @Get()
  findAll() {
    return this.careerService.findAll();
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.careerService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id', ParseIntPipe) id: number, @Body() updateCareerDto: Prisma.JobUpdateInput) {
    return this.careerService.update(id, updateCareerDto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.careerService.remove(id);
  }
}
