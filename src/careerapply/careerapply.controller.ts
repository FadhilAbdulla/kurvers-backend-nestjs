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
  UploadedFiles,
} from '@nestjs/common';
import { CareerapplyService } from './careerapply.service';
import { Prisma } from '@prisma/client';
import { FileFieldsInterceptor, FileInterceptor, FilesInterceptor } from '@nestjs/platform-express';
import { FileUploadService } from 'src/fileupload/fileupload.service';
// import { CreateCareerapplyDto } from './dto/create-careerapply.dto';
// import { UpdateCareerapplyDto } from './dto/update-careerapply.dto';

@Controller('careerapply')
export class CareerapplyController {
  constructor(
    private readonly careerapplyService: CareerapplyService,
    private readonly fileUploadService: FileUploadService
  ) {}

  // @Post()
  // @UseInterceptors(
  //   FileInterceptor('resume', new FileUploadService().getMulterOptions()),
  //   FileInterceptor('coverLetter', new FileUploadService().getMulterOptions())
  // )
  // async create(
  //   @UploadedFile() file: Express.Multer.File,
  //   @UploadedFile() coverletter: Express.Multer.File,
  //   @Body() createCareerapplyDto: Prisma.JobApplyCreateInput
  // ) {
  //   if (file && coverletter) {
  //     const res = await this.fileUploadService.uploadToLocal(file);
  //     const res1 = await this.fileUploadService.uploadToLocal(coverletter);
  //     console.log(res, res1);
  //     createCareerapplyDto.resume = res;
  //     createCareerapplyDto.coverLetter = res1;
  //   } else {
  //     return new BadRequestException('Please upload a resume');
  //   }

  //   createCareerapplyDto.job = {
  //     connect: { id: +createCareerapplyDto.job },
  //   };

  //   console.log(createCareerapplyDto);
  //   return this.careerapplyService.create(createCareerapplyDto);
  // }

  @Post()
  @UseInterceptors(
    FilesInterceptor('files', 2, new FileUploadService().getMulterOptions()) // 'files' is the key for both resume and coverLetter
  )
  async create(@UploadedFiles() files: Array<Express.Multer.File>, @Body() createCareerapplyDto: Prisma.JobApplyCreateInput) {
    if (files.length !== 2) {
      throw new BadRequestException('Please upload both resume and cover letter');
    }

    const [resumeFile, coverLetterFile] = files;

    // Upload files
    const resumePath = await this.fileUploadService.uploadToLocal(resumeFile);
    const coverLetterPath = await this.fileUploadService.uploadToLocal(coverLetterFile);

    // Assign file paths to DTO
    createCareerapplyDto.resume = resumePath;
    createCareerapplyDto.coverLetter = coverLetterPath;

    // Connect the job relation
    createCareerapplyDto.job = {
      connect: { id: +createCareerapplyDto.job },
    };
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
