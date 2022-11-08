library(readxl)
library(readr)
library(dplyr)

#Tabla de altas Hospitalarias
Altas_Hospitalarias <- read_excel("INPUT/DATA/Altas_Hospitalarias.xls")
View(Altas_Hospitalarias)

#Tabla de la calidad del aire de la Palma
Calidad_Aire_Palma2020 <- read_excel("INPUT/DATA/Calidad_Aire_Palma.xls")
View(Calidad_Aire_Palma2020)

#Tabla de la calidad del aire de Gijón
Calidad_Aire_Gijon <- read_delim("INPUT/DATA/Calidad_Aire_Gijon.csv", 
                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(Calidad_Aire_Gijon)

#Tabla de la calidad del aire de Aragón
Calidad_Aire_Aragon <- read_excel("INPUT/DATA/IGEAR Calidad del aire - estac_ica_data.xlsx")
View(Calidad_Aire_Aragon)

#Tabla de la calidad del aire de Cantabria ya editada
Calidad_Aire_Cantabria_Sin_Corte <- read_excel("INPUT/DATA/Calidad_Aire_Cantabria.xls")
View(Calidad_Aire_Cantabria_Sin_Corte)
Calidad_Aire_Cantabria2020 <- Calidad_Aire_Cantabria_Sin_Corte[286:297,]
View(Calidad_Aire_Cantabria2020)

#Tabla de la calidad del aire de Madrid con el nombre de las magnitudes correcto
Calidad_Aire_Madrid <- read_delim("INPUT/DATA/Calidad_Aire_Madrid.csv", 
                                  delim = ";", escape_double = FALSE, trim_ws = TRUE)
Calidad_Aire_Madrid <- mutate(Calidad_Aire_Madrid, magnitud = case_when(magnitud == 1 ~ 'SO2',  magnitud == 6 ~ 'CO', magnitud == 7 ~ 'NO', magnitud == 8 ~ 'NO2', magnitud == 9 ~ 'PM2.5', magnitud == 10 ~ 'PM10', magnitud == 12 ~ 'NOx', magnitud == 14 ~ 'O3', magnitud == 20 ~ 'C7H8', magnitud == 22 ~ 'Carbon_Negro', magnitud == 30 ~ 'C6H6', magnitud == 42 ~ 'CHtot', magnitud == 44 ~ 'CHnoMet', magnitud == 431 ~ 'MPX'))
View(Calidad_Aire_Madrid)
