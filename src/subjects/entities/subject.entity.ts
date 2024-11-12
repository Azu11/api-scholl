import { ApiProperty } from '@nestjs/swagger';
import { Subject } from '@prisma/client';

export class SubjectEntity implements Subject {
  @ApiProperty({ type: Number })
  id: number;

  @ApiProperty({ type: String })
  name: string;

  @ApiProperty({ type: Boolean })
  status: boolean;

  @ApiProperty({ type: Number })
  averagingpreperiod_asig: number;

  @ApiProperty({ type: Number })
  annual_asig_average: number;
}
