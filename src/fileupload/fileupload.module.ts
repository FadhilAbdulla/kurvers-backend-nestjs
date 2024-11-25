import { Module } from '@nestjs/common';
import { FileUploadService } from './fileupload.service';

@Module({
  providers: [FileUploadService], // Provide the service
  exports: [FileUploadService], // Export the service for other modules
})
export class FileUploadModule {}
