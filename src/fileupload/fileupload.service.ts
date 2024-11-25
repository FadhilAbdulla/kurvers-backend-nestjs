import { Injectable, BadRequestException } from '@nestjs/common';
import { diskStorage } from 'multer';
import { extname } from 'path';
import { v4 as uuid } from 'uuid';

@Injectable()
export class FileUploadService {
  /**
   * Handle file upload locally
   * @param file The file object from Multer
   * @returns The file path
   */
  async uploadToLocal(file: Express.Multer.File): Promise<string> {
    if (!file) {
      throw new BadRequestException('File is required');
    }
    return file.path; // Return the file path
  }

  /**
   * Multer configuration for local storage
   */
  getMulterOptions() {
    return {
      storage: diskStorage({
        destination: './uploads', // Directory to save files
        filename: (req, file, callback) => {
          const uniqueName = `${Date.now()}-${uuid()}${extname(file.originalname)}`;
          callback(null, uniqueName);
        },
      }),
    };
  }
}
