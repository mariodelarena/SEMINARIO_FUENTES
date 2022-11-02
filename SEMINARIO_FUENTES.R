library(readxl)
Altas_Hospitalarias <- read_excel("INPUT/DATA/Altas_Hospitalarias.xls")

Altas_Hospitalarias
View(Altas_Hospitalarias)

Calidad_Aire_Palma <- read_excel("INPUT/DATA/Calidad_Aire_Palma.xls")
View(Calidad_Aire_Palma)

library(readr)
Calidad_Aire_Gijon <- read_csv("INPUT/DATA/Calidad_Aire_Gijon.csv")
View(Calidad_Aire_Gijon)

IGEAR_Calidad_del_aire_estac_ica_data <- read_excel("INPUT/DATA/IGEAR Calidad del aire - estac_ica_data.xlsx")
View(IGEAR_Calidad_del_aire_estac_ica_data)

#Hay que seleccionar el año 2020 row(1:12) y row(286:298)
Calidad_Aire_Cantabria <- read_excel("INPUT/DATA/Calidad_Aire_Cantabria.xls")
View(Calidad_Aire_Cantabria)

