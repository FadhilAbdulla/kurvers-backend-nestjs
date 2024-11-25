import { Controller, Get, Post, Body, Patch, Param, Delete, UseInterceptors, UploadedFile } from '@nestjs/common';
import { BannerService } from './banner.service';
import { Prisma } from '@prisma/client';
import { FileInterceptor } from '@nestjs/platform-express';
import { CreateBannerDto } from './dto/create-banner.dto';
// import { UpdateBannerDto } from './dto/update-banner.dto';
import { FileUploadService } from 'src/fileupload/fileupload.service';

@Controller('banner')
export class BannerController {
  constructor(
    private readonly bannerService: BannerService,
    private readonly fileUploadService: FileUploadService
  ) {}

  @Post()
  @UseInterceptors(FileInterceptor('file', new FileUploadService().getMulterOptions()))
  async create(@UploadedFile() file: Express.Multer.File, @Body() createBannerDto: Prisma.BannerCreateInput) {
    if (file) {
      const res = await this.fileUploadService.uploadToLocal(file);
      createBannerDto.banner = res;
    } else {
      console.log('something went wrong');
    }
    return this.bannerService.create(createBannerDto);
  }

  @Get()
  findAll() {
    return this.bannerService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.bannerService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateBannerDto: Prisma.BannerUpdateInput) {
    return this.bannerService.update(+id, updateBannerDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.bannerService.remove(+id);
  }
}
