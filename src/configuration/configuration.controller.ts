import { Controller, Get, Post, Body, Patch, Param, Delete, ParseIntPipe } from '@nestjs/common';
import { ConfigurationService } from './configuration.service';
import { Prisma } from '@prisma/client';

@Controller('configuration')
export class ConfigurationController {
  constructor(private readonly configurationService: ConfigurationService) {}

  @Post()
  create(@Body() createConfigurationDto: Prisma.ConfigurationCreateInput) {
    return this.configurationService.create(createConfigurationDto);
  }

  @Get()
  findAll() {
    return this.configurationService.findAll();
  }
  @Get('activity-logs')
  findLogs() {
    return this.configurationService.findLogs();
  }
  @Get('contact-us')
  findContactUs() {
    return this.configurationService.findContactUS();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.configurationService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id', ParseIntPipe) id: number, @Body() updateConfigurationDto: Prisma.ConfigurationUpdateInput) {
    return this.configurationService.update(id, updateConfigurationDto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.configurationService.remove(id);
  }
}
