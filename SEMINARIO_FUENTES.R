library(readxl)
Altas_Hospitalarias <- read_excel("INPUT/DATA/Altas_Hospitalarias.xls")

Altas_Hospitalarias
View(Altas_Hospitalarias)

Calidad_Aire_Palma2020 <- read_excel("INPUT/DATA/Calidad_Aire_Palma.xls")
View(Calidad_Aire_Palma2020)

library(readr)

Calidad_Aire_Gijon <- read_delim("INPUT/DATA/Calidad_Aire_Gijon.csv", 
                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(Calidad_Aire_Gijon)

Calidad_Aire_Aragon <- read_excel("INPUT/DATA/IGEAR Calidad del aire - estac_ica_data.xlsx")
View(Calidad_Aire_Aragon)

#Hay que seleccionar el año 2020 row(1:12) y row(286:298)
Calidad_Aire_Cantabria_Sin_Corte <- read_excel("INPUT/DATA/Calidad_Aire_Cantabria.xls")
View(Calidad_Aire_Cantabria_Sin_Corte)
Calidad_Aire_Cantabria2020 <- Calidad_Aire_Cantabria_Sin_Corte[286:297,]
View(Calidad_Aire_Cantabria2020)

#Hay que cambiar el nombre de las magnitudes
Calidad_Aire_Madrid <- read_delim("INPUT/DATA/Calidad_Aire_Madrid.csv", 
                                  delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(Calidad_Aire_Madrid)
rename(.data = Calidad_Aire_Madrid, 1 = SO2, 6 = CO,7 = NO, 8 = NO2, 9 = PM2.5, 10 = PM10, 12 = NOx, 14 = O3, 20 = C7H8, 22 = Carbon_Negro, 30 = C6H6, 42 = CHtot, 44 = CHnoMet, 431 = MPX)
