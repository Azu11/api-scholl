-- AlterTable
ALTER TABLE `asignatura` MODIFY `PROMEDIONOTASPERIODO_ASIG` DOUBLE NULL,
    MODIFY `PROMEDIO_ANUAL_ASIG` DOUBLE NULL;

-- AlterTable
ALTER TABLE `estudiante` MODIFY `PROMEDIONOTASPERIODO_EST` DOUBLE NULL,
    MODIFY `PROMEDIO_ANUAL_EST` DOUBLE NULL,
    MODIFY `PROMEDIO_NOTAS_EST` DOUBLE NULL;

-- AlterTable
ALTER TABLE `grado` MODIFY `PROMEDIONOTASPERIODO_GRA` DOUBLE NULL,
    MODIFY `PROMEDIO_ANUAL_GRA` DOUBLE NULL;

-- AlterTable
ALTER TABLE `grupo` MODIFY `PROMEDIONOTASPERIODO_GRU` DOUBLE NULL,
    MODIFY `PROMEDIO_ANUAL_GRU` DOUBLE NULL;