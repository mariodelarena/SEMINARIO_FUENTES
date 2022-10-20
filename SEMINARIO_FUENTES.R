library(readxl)
Altas_Hospitalarias <- read_excel("C:/Users/super/OneDrive/Escritorio/Curso 2022-2023/1º Semestre/Fuentes de Datos Biomédicas y Web Semántica/SEMINARIO_FUENTES/INPUT/DATA/Altas_Hospitalarias.xls")

Altas_Hospitalarias
str(Altas_Hospitalarias)
summary(Altas_Hospitalarias)
View(Altas_Hospitalarias)

Calidad_Aire_Palma <- read_excel("INPUT/DATA/Calidad_Aire_Palma.xls")
View(Calidad_Aire_Palma)
