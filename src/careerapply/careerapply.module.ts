import { Module } from '@nestjs/common';
import { CareerapplyService } from './careerapply.service';
import { CareerapplyController } from './careerapply.controller';

@Module({
  controllers: [CareerapplyController],
  providers: [CareerapplyService],
})
export class CareerapplyModule {}
