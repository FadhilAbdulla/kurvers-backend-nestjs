import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { UserModule } from './user/user.module';
import { DatabaseModule } from './database/database.module';
import { RoleModule } from './role/role.module';
import { PermissionModule } from './permission/permission.module';
import { ConfigurationModule } from './configuration/configuration.module';
import { CareerModule } from './career/career.module';
import { CareerapplyModule } from './careerapply/careerapply.module';
import { BannerModule } from './banner/banner.module';
import { FileUploadService } from './fileupload/fileupload.service';
import { FileUploadModule } from './fileupload/fileupload.module';
import { PagesModule } from './pages/pages.module';

@Module({
  imports: [
    AuthModule,
    UserModule,
    DatabaseModule,
    RoleModule,
    PermissionModule,
    ConfigurationModule,
    CareerModule,
    CareerapplyModule,
    BannerModule,
    FileUploadModule,
    PagesModule,
  ],
  controllers: [AppController],
  providers: [AppService, FileUploadService],
})
export class AppModule {}
