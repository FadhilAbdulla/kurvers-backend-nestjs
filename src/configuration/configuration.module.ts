import { Module } from '@nestjs/common';
import { ConfigurationService } from './configuration.service';
import { ConfigurationController } from './configuration.controller';
import { FileUploadService } from 'src/fileupload/fileupload.service';

@Module({
  controllers: [ConfigurationController],
  providers: [ConfigurationService, FileUploadService],
})
export class ConfigurationModule { }
