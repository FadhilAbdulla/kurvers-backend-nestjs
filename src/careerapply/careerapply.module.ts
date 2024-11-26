import { Module } from '@nestjs/common';
import { CareerapplyService } from './careerapply.service';
import { CareerapplyController } from './careerapply.controller';
import { FileUploadModule } from 'src/fileupload/fileupload.module';

@Module({
  imports: [FileUploadModule],
  controllers: [CareerapplyController],
  providers: [CareerapplyService],
})
export class CareerapplyModule {}
