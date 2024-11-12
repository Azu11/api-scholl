/*
  Warnings:

  - Added the required column `PROMEDIONOTASPERIODO_ASIG` to the `ASIGNATURA` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PROMEDIO_ANUAL_ASIG` to the `ASIGNATURA` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PROMEDIONOTASPERIODO_EST` to the `ESTUDIANTE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PROMEDIO_ANUAL_EST` to the `ESTUDIANTE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PROMEDIO_NOTAS_EST` to the `ESTUDIANTE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PROMEDIONOTASPERIODO_GRA` to the `GRADO` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PROMEDIO_ANUAL_GRA` to the `GRADO` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PROMEDIONOTASPERIODO_GRU` to the `GRUPO` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PROMEDIO_ANUAL_GRU` to the `GRUPO` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `asignatura` ADD COLUMN `PROMEDIONOTASPERIODO_ASIG` DOUBLE NOT NULL,
    ADD COLUMN `PROMEDIO_ANUAL_ASIG` DOUBLE NOT NULL;

-- AlterTable
ALTER TABLE `estudiante` ADD COLUMN `PROMEDIONOTASPERIODO_EST` DOUBLE NOT NULL,
    ADD COLUMN `PROMEDIO_ANUAL_EST` DOUBLE NOT NULL,
    ADD COLUMN `PROMEDIO_NOTAS_EST` DOUBLE NOT NULL;

-- AlterTable
ALTER TABLE `grado` ADD COLUMN `PROMEDIONOTASPERIODO_GRA` DOUBLE NOT NULL,
    ADD COLUMN `PROMEDIO_ANUAL_GRA` DOUBLE NOT NULL;

-- AlterTable
ALTER TABLE `grupo` ADD COLUMN `PROMEDIONOTASPERIODO_GRU` DOUBLE NOT NULL,
    ADD COLUMN `PROMEDIO_ANUAL_GRU` DOUBLE NOT NULL;

-- CreateTable
CREATE TABLE `MATRICULA` (
    `ID_REGISTRO` INTEGER NOT NULL AUTO_INCREMENT,
    `ANIO_MATRICULA` INTEGER NOT NULL,
    `CODIGO_GRA` INTEGER NOT NULL,

    PRIMARY KEY (`ID_REGISTRO`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `MATRICULA` ADD CONSTRAINT `MATRICULA_CODIGO_GRA_fkey` FOREIGN KEY (`CODIGO_GRA`) REFERENCES `GRADO`(`CODIGO_GRA`) ON DELETE RESTRICT ON UPDATE CASCADE;
