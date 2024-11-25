import { Test, TestingModule } from '@nestjs/testing';
import { CareerapplyController } from './careerapply.controller';
import { CareerapplyService } from './careerapply.service';

describe('CareerapplyController', () => {
  let controller: CareerapplyController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CareerapplyController],
      providers: [CareerapplyService],
    }).compile();

    controller = module.get<CareerapplyController>(CareerapplyController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
