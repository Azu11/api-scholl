import { ApiProperty } from '@nestjs/swagger';
import {
  IsNotEmpty,
  IsString,
  MinLength,
  IsOptional,
  IsNumber,
} from 'class-validator';

export class CreateDegreeDto {
  @IsString()
  @IsNotEmpty()
  @MinLength(5)
  @ApiProperty({ type: String, required: true })
  name: string;

  @IsOptional()
  @IsNumber()
  @ApiProperty({ type: Number, required: false })
  averagingpreperiod_gra?: number;

  @IsOptional()
  @IsNumber()
  @ApiProperty({ type: Number, required: false })
  annual_gra_average?: number;

  @IsOptional()
  @ApiProperty({ type: Boolean, required: false })
  status?: boolean;
}
