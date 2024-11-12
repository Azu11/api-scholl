import { ApiProperty } from '@nestjs/swagger';
import { Degree } from '@prisma/client';

export class DegreeEntity implements Partial<Degree> {
  @ApiProperty({ type: Number })
  id: number;

  @ApiProperty({ type: String })
  name: string;

  @ApiProperty({ type: Boolean })
  status: boolean;

  @ApiProperty({ type: Number, required: false })
  averagingpreperiod_gra?: number;

  @ApiProperty({ type: Number, required: false })
  annual_gra_average?: number;
}
