import { ApiProperty } from '@nestjs/swagger';
import {
  IsNotEmpty,
  IsString,
  MinLength,
  IsOptional,
  IsNumber,
} from 'class-validator';

export class CreateSubjectDto {
  @IsString()
  @IsNotEmpty()
  @MinLength(5)
  @ApiProperty({ type: String })
  name: string;

  @IsOptional()
  @IsNumber()
  @ApiProperty({ type: Number, required: false })
  averagingpreperiod_asig?: number;

  @IsOptional()
  @IsNumber()
  @ApiProperty({ type: Number, required: false })
  annual_asig_average?: number;
}
