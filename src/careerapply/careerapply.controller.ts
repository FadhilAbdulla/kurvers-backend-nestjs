import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseInterceptors,
  UploadedFile,
  ForbiddenException,
  BadRequestException,
} from '@nestjs/common';
import { CareerapplyService } from './careerapply.service';
import { Prisma } from '@prisma/client';
import { FileFieldsInterceptor, FileInterceptor } from '@nestjs/platform-express';
import { FileUploadService } from 'src/fileupload/fileupload.service';
// import { CreateCareerapplyDto } from './dto/create-careerapply.dto';
// import { UpdateCareerapplyDto } from './dto/update-careerapply.dto';

@Controller('careerapply')
export class CareerapplyController {
  constructor(
    private readonly careerapplyService: CareerapplyService,
    private readonly fileUploadService: FileUploadService
  ) {}

  @Post()
  @UseInterceptors(FileInterceptor('resume', new FileUploadService().getMulterOptions()))
  async create(@UploadedFile() file: Express.Multer.File, @Body() createCareerapplyDto: Prisma.JobApplyCreateInput) {
    if (file) {
      const res = await this.fileUploadService.uploadToLocal(file);
      createCareerapplyDto.resume = res;
      createCareerapplyDto.coverLetter = res;
    } else {
      return new BadRequestException('Please upload a resume');
    }

    createCareerapplyDto.job = {
      connect: { id: +createCareerapplyDto.job },
    };

    console.log(createCareerapplyDto);
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
