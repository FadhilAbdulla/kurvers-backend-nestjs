import { Module } from '@nestjs/common';
import { BannerService } from './banner.service';
import { BannerController } from './banner.controller';
import { FileUploadModule } from '../fileupload/fileupload.module';

@Module({
  imports: [FileUploadModule],
  controllers: [BannerController],
  providers: [BannerService],
})
export class BannerModule {}
