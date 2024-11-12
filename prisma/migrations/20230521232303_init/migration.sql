-- CreateTable
CREATE TABLE `RH` (
    `ID_RH` INTEGER NOT NULL AUTO_INCREMENT,
    `NOMBRE_RH` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `RH_NOMBRE_RH_key`(`NOMBRE_RH`),
    PRIMARY KEY (`ID_RH`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DOCUMENTO` (
    `ID_DOCUMENTO` INTEGER NOT NULL AUTO_INCREMENT,
    `TIPO_DOC` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `DOCUMENTO_TIPO_DOC_key`(`TIPO_DOC`),
    PRIMARY KEY (`ID_DOCUMENTO`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PERSONA` (
    `ID_PERSONA` INTEGER NOT NULL AUTO_INCREMENT,
    `NUMERO_DOC_PER` INTEGER NOT NULL,
    `NOMBRE_UNO_PER` VARCHAR(191) NOT NULL,
    `NOMBRE_DOS_PER` VARCHAR(191) NULL,
    `APELLIDO_UNO_PER` VARCHAR(191) NOT NULL,
    `APELLIDO_DOS_PER` VARCHAR(191) NULL,
    `SEXO_PER` ENUM('Male', 'Female') NOT NULL,
    `NUMERO_CONTACTO_PER` INTEGER NULL,
    `FECHA_NAC_PER` DATETIME(3) NOT NULL,
    `ID_DOCUMENTO` INTEGER NOT NULL,
    `ID_RH` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `PERSONA_NUMERO_DOC_PER_key`(`NUMERO_DOC_PER`),
    PRIMARY KEY (`ID_PERSONA`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `USUARIO` (
    `USUARIO_USU` VARCHAR(191) NOT NULL,
    `CONTRASENIA_USU` VARCHAR(191) NOT NULL,
    `FECHA_ING_USU` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `FECHA_EGR_USU` DATETIME(3) NULL,
    `ROLL_USU` ENUM('Teacher', 'Student') NOT NULL DEFAULT 'Student',
    `ID_PERSONA` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `USUARIO_ID_PERSONA_key`(`ID_PERSONA`),
    PRIMARY KEY (`USUARIO_USU`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DOCENTE` (
    `CORREO_DOC` VARCHAR(191) NOT NULL,
    `PROFESION_DOC` VARCHAR(191) NOT NULL,
    `ID_PERSONA` INTEGER NOT NULL,

    PRIMARY KEY (`ID_PERSONA`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ESTUDIANTE` (
    `FOTO_EST` VARCHAR(191) NOT NULL,
    `ID_PERSONA` INTEGER NOT NULL,
    `ID_DOCENTE` INTEGER NOT NULL,

    PRIMARY KEY (`ID_PERSONA`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GRADO` (
    `CODIGO_GRA` INTEGER NOT NULL AUTO_INCREMENT,
    `NOMBRE_GRA` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`CODIGO_GRA`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ASIGNATURA` (
    `CODIGO_ASIG` INTEGER NOT NULL AUTO_INCREMENT,
    `NOMBRE_ASIG` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`CODIGO_ASIG`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GRADO_ASIGNATURA` (
    `DESCRIPCION` VARCHAR(191) NOT NULL,
    `CODIGO_ASIG` INTEGER NOT NULL,
    `CODIGO_GRA` INTEGER NOT NULL,

    PRIMARY KEY (`CODIGO_ASIG`, `CODIGO_GRA`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ASISTENCIA` (
    `ID_ASISTENCIA` INTEGER NOT NULL AUTO_INCREMENT,
    `FECHA_ASIS` DATETIME(3) NOT NULL,

    PRIMARY KEY (`ID_ASISTENCIA`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ASISTENCIA_ESTUDIANTE` (
    `ESTADO` ENUM('Attended', 'Absent', 'Excused') NOT NULL,
    `ID_ESTUDIANTE` INTEGER NOT NULL,
    `ID_ASISTENCIA` INTEGER NOT NULL,

    PRIMARY KEY (`ID_ESTUDIANTE`, `ID_ASISTENCIA`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GRUPO` (
    `CODIGO_GRU` INTEGER NOT NULL AUTO_INCREMENT,
    `ESTADO_GRU` ENUM('Active', 'Inactive') NOT NULL,
    `ANIO_GRU` INTEGER NOT NULL,
    `NOMBRE_GRU` VARCHAR(191) NOT NULL,
    `CODIGO_GRA` INTEGER NOT NULL,

    PRIMARY KEY (`CODIGO_GRU`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ESTUDIANTE_GRUPO` (
    `ESTADO` ENUM('Active', 'Inactive') NOT NULL,
    `ID_ESTUDIANTE` INTEGER NOT NULL,
    `CODIGO_GRU` INTEGER NOT NULL,

    PRIMARY KEY (`ID_ESTUDIANTE`, `CODIGO_GRU`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OBSERVACION` (
    `ID_OBSERVACION` INTEGER NOT NULL AUTO_INCREMENT,
    `FECHA_OBS` DATETIME(3) NOT NULL,
    `DESCRIPCION_OBS` VARCHAR(191) NOT NULL,
    `ID_ESTUDIANTE` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`ID_OBSERVACION`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ACUDIENTE` (
    `ID_ACUDIENTE` INTEGER NOT NULL AUTO_INCREMENT,
    `NOMBRE_UNO_ACU` VARCHAR(191) NOT NULL,
    `NOMBRE_DOS_ACU` VARCHAR(191) NULL,
    `APELLIDO_UNO_ACU` VARCHAR(191) NOT NULL,
    `APELLIDO_DOS_ACU` VARCHAR(191) NULL,
    `NUMERO_CONTACTO_ACU` INTEGER NOT NULL,

    PRIMARY KEY (`ID_ACUDIENTE`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ESTUDIANTE_ACUDIENTE` (
    `ESTADO` ENUM('Active', 'Inactive') NOT NULL,
    `ID_ACUDIENTE` INTEGER NOT NULL,
    `ID_ESTUDIANTE` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`ID_ACUDIENTE`, `ID_ESTUDIANTE`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PERIODO` (
    `ID_PERIODO` INTEGER NOT NULL AUTO_INCREMENT,
    `NOMBRE_PER` VARCHAR(191) NOT NULL,
    `NUMERO_PER` INTEGER NOT NULL,
    `FECHA_INICIO_PER` DATETIME(3) NOT NULL,
    `FECHA_FIN_PER` DATETIME(3) NULL,

    PRIMARY KEY (`ID_PERIODO`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `NOTA` (
    `ID_NOTA` INTEGER NOT NULL AUTO_INCREMENT,
    `VALOR_NOTA` DOUBLE NOT NULL,
    `DESCRIPCION_NOTA` VARCHAR(191) NOT NULL,
    `PORCENTAJE_NOTA` DOUBLE NOT NULL,
    `ID_PERIODO` INTEGER NOT NULL,
    `CODIGO_ASIG` INTEGER NOT NULL,
    `ID_ESTUDIANTE` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`ID_NOTA`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DIA_SEMANA` (
    `ID_DIA_SEMANA` INTEGER NOT NULL AUTO_INCREMENT,
    `DIA_SEMANA_HOR` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `DIA_SEMANA_DIA_SEMANA_HOR_key`(`DIA_SEMANA_HOR`),
    PRIMARY KEY (`ID_DIA_SEMANA`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BLOQUE_HORA` (
    `ID_BLOQUE_HORA` INTEGER NOT NULL AUTO_INCREMENT,
    `INICIO_HORA_BLO` VARCHAR(191) NOT NULL,
    `FIN_HORA_BLO` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `BLOQUE_HORA_INICIO_HORA_BLO_FIN_HORA_BLO_key`(`INICIO_HORA_BLO`, `FIN_HORA_BLO`),
    PRIMARY KEY (`ID_BLOQUE_HORA`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `HORARIO` (
    `ID_HORARIO` INTEGER NOT NULL AUTO_INCREMENT,
    `ANIO` INTEGER NOT NULL,
    `CANTIDAD_HORA_HOR` VARCHAR(191) NOT NULL,
    `ID_DIA_SEMANA` INTEGER NOT NULL,
    `ID_BLOQUE_HORA` INTEGER NOT NULL,
    `CODIGO_ASIG` INTEGER NOT NULL,

    PRIMARY KEY (`ID_HORARIO`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `PERSONA` ADD CONSTRAINT `PERSONA_ID_DOCUMENTO_fkey` FOREIGN KEY (`ID_DOCUMENTO`) REFERENCES `DOCUMENTO`(`ID_DOCUMENTO`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PERSONA` ADD CONSTRAINT `PERSONA_ID_RH_fkey` FOREIGN KEY (`ID_RH`) REFERENCES `RH`(`ID_RH`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `USUARIO` ADD CONSTRAINT `USUARIO_ID_PERSONA_fkey` FOREIGN KEY (`ID_PERSONA`) REFERENCES `PERSONA`(`ID_PERSONA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DOCENTE` ADD CONSTRAINT `DOCENTE_ID_PERSONA_fkey` FOREIGN KEY (`ID_PERSONA`) REFERENCES `PERSONA`(`ID_PERSONA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ESTUDIANTE` ADD CONSTRAINT `ESTUDIANTE_ID_PERSONA_fkey` FOREIGN KEY (`ID_PERSONA`) REFERENCES `PERSONA`(`ID_PERSONA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ESTUDIANTE` ADD CONSTRAINT `ESTUDIANTE_ID_DOCENTE_fkey` FOREIGN KEY (`ID_DOCENTE`) REFERENCES `DOCENTE`(`ID_PERSONA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GRADO_ASIGNATURA` ADD CONSTRAINT `GRADO_ASIGNATURA_CODIGO_ASIG_fkey` FOREIGN KEY (`CODIGO_ASIG`) REFERENCES `GRADO`(`CODIGO_GRA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GRADO_ASIGNATURA` ADD CONSTRAINT `GRADO_ASIGNATURA_CODIGO_GRA_fkey` FOREIGN KEY (`CODIGO_GRA`) REFERENCES `ASIGNATURA`(`CODIGO_ASIG`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ASISTENCIA_ESTUDIANTE` ADD CONSTRAINT `ASISTENCIA_ESTUDIANTE_ID_ESTUDIANTE_fkey` FOREIGN KEY (`ID_ESTUDIANTE`) REFERENCES `ESTUDIANTE`(`ID_PERSONA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ASISTENCIA_ESTUDIANTE` ADD CONSTRAINT `ASISTENCIA_ESTUDIANTE_ID_ASISTENCIA_fkey` FOREIGN KEY (`ID_ASISTENCIA`) REFERENCES `ASISTENCIA`(`ID_ASISTENCIA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GRUPO` ADD CONSTRAINT `GRUPO_CODIGO_GRA_fkey` FOREIGN KEY (`CODIGO_GRA`) REFERENCES `GRADO`(`CODIGO_GRA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ESTUDIANTE_GRUPO` ADD CONSTRAINT `ESTUDIANTE_GRUPO_ID_ESTUDIANTE_fkey` FOREIGN KEY (`ID_ESTUDIANTE`) REFERENCES `ESTUDIANTE`(`ID_PERSONA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ESTUDIANTE_GRUPO` ADD CONSTRAINT `ESTUDIANTE_GRUPO_CODIGO_GRU_fkey` FOREIGN KEY (`CODIGO_GRU`) REFERENCES `GRUPO`(`CODIGO_GRU`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OBSERVACION` ADD CONSTRAINT `OBSERVACION_ID_ESTUDIANTE_fkey` FOREIGN KEY (`ID_ESTUDIANTE`) REFERENCES `ESTUDIANTE`(`ID_PERSONA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ESTUDIANTE_ACUDIENTE` ADD CONSTRAINT `ESTUDIANTE_ACUDIENTE_ID_ACUDIENTE_fkey` FOREIGN KEY (`ID_ACUDIENTE`) REFERENCES `ACUDIENTE`(`ID_ACUDIENTE`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ESTUDIANTE_ACUDIENTE` ADD CONSTRAINT `ESTUDIANTE_ACUDIENTE_ID_ESTUDIANTE_fkey` FOREIGN KEY (`ID_ESTUDIANTE`) REFERENCES `ESTUDIANTE`(`ID_PERSONA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NOTA` ADD CONSTRAINT `NOTA_ID_PERIODO_fkey` FOREIGN KEY (`ID_PERIODO`) REFERENCES `PERIODO`(`ID_PERIODO`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NOTA` ADD CONSTRAINT `NOTA_CODIGO_ASIG_fkey` FOREIGN KEY (`CODIGO_ASIG`) REFERENCES `ASIGNATURA`(`CODIGO_ASIG`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NOTA` ADD CONSTRAINT `NOTA_ID_ESTUDIANTE_fkey` FOREIGN KEY (`ID_ESTUDIANTE`) REFERENCES `ESTUDIANTE`(`ID_PERSONA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HORARIO` ADD CONSTRAINT `HORARIO_ID_DIA_SEMANA_fkey` FOREIGN KEY (`ID_DIA_SEMANA`) REFERENCES `DIA_SEMANA`(`ID_DIA_SEMANA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HORARIO` ADD CONSTRAINT `HORARIO_ID_BLOQUE_HORA_fkey` FOREIGN KEY (`ID_BLOQUE_HORA`) REFERENCES `BLOQUE_HORA`(`ID_BLOQUE_HORA`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HORARIO` ADD CONSTRAINT `HORARIO_CODIGO_ASIG_fkey` FOREIGN KEY (`CODIGO_ASIG`) REFERENCES `ASIGNATURA`(`CODIGO_ASIG`) ON DELETE RESTRICT ON UPDATE CASCADE;
