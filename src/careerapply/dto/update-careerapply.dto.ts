import { PartialType } from '@nestjs/mapped-types';
import { CreateCareerapplyDto } from './create-careerapply.dto';

export class UpdateCareerapplyDto extends PartialType(CreateCareerapplyDto) {}
