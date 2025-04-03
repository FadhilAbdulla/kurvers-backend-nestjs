import { Controller, Get, Post, Body, Patch, Param, Delete, ParseIntPipe, UseInterceptors, UploadedFile, HttpException } from '@nestjs/common';
import { ConfigurationService } from './configuration.service';
import { Prisma } from '@prisma/client';
import { FileUploadService } from 'src/fileupload/fileupload.service';
import { FileInterceptor } from '@nestjs/platform-express';

@Controller('configuration')
export class ConfigurationController {
  constructor(private readonly configurationService: ConfigurationService, private readonly fileUploadService: FileUploadService) { }

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

  @Post('imageUpload')
  @UseInterceptors(FileInterceptor('file', new FileUploadService().getMulterOptions()))
  async imageUpload(@UploadedFile() file: Express.Multer.File, @Body() createBannerDto: Prisma.BannerCreateInput) {
    if (file) {
      const res = await this.fileUploadService.uploadToLocal(file);
      return { imageKey: res };
    } else {
      console.log('something went wrong');
      throw new HttpException('Invalid file', 400);
    }
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateConfigurationDto: Prisma.ConfigurationUpdateInput) {
    return this.configurationService.update(id, updateConfigurationDto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.configurationService.remove(id);
  }
}
