import { Test, TestingModule } from '@nestjs/testing';
import { CareerapplyService } from './careerapply.service';

describe('CareerapplyService', () => {
  let service: CareerapplyService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [CareerapplyService],
    }).compile();

    service = module.get<CareerapplyService>(CareerapplyService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
