library(readxl)
library(readr)
library(dplyr)

#Tabla de altas Hospitalarias
Altas_Hospitalarias <- read_excel("INPUT/DATA/Altas_Hospitalarias.xls")
Altas_Hospitalarias <- Altas_Hospitalarias[6:157, ]
Altas_Hospitalarias <- Altas_Hospitalarias %>% select(1, 12, 16, 17, 21)

Altas_Hospitalarias_Madrid <- read_excel("INPUT/DATA/Altas_Hospitalarias_Madrid.xls", 
                                         sheet = "I.1.2")
Altas_Hospitalarias_Madrid <- Altas_Hospitalarias_Madrid[19:30, 1:2]
View(Altas_Hospitalarias_Madrid)
#Añadir una columna a altas hospitalarias con los datos de Madrid.
View(Altas_Hospitalarias)

#Tabla de la calidad del aire de la Palma
Calidad_Aire_Palma2020 <- read_excel("INPUT/DATA/Calidad_Aire_Palma.xls")
Calidad_Aire_Palma2020 <- Calidad_Aire_Palma2020 %>% select(-PERIODO_HI, -starts_with('FL'))

View(Calidad_Aire_Palma2020)

#Tabla de la calidad del aire de Gijón
Calidad_Aire_Gijon <- read_delim("INPUT/DATA/Calidad_Aire_Gijon.csv", 
                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
Calidad_Aire_Gijon <- Calidad_Aire_Gijon %>% select(-Estacion, -Titulo, -latitud, -longitud, -Periodo)

View(Calidad_Aire_Gijon)

#Tabla de la calidad del aire de Aragón
Calidad_Aire_Aragon <- read_excel("INPUT/DATA/IGEAR Calidad del aire - estac_ica_data.xlsx")
Calidad_Aire_Aragon <- Calidad_Aire_Aragon %>% select(-id, -dato_medido, -dato_medido_mm)

View(Calidad_Aire_Aragon)

#Tabla de la calidad del aire de Cantabria ya editada
Calidad_Aire_Cantabria_Sin_Corte <- read_excel("INPUT/DATA/Calidad_Aire_Cantabria.xls")
Calidad_Aire_Cantabria2020 <- Calidad_Aire_Cantabria_Sin_Corte[286:297,]
View(Calidad_Aire_Cantabria2020)

#Tabla de la calidad del aire de Madrid con el nombre de las magnitudes correcto
Calidad_Aire_Madrid <- read_delim("INPUT/DATA/Calidad_Aire_Madrid.csv", 
                                  delim = ";", escape_double = FALSE, trim_ws = TRUE)
Calidad_Aire_Madrid <- 
  mutate(Calidad_Aire_Madrid, magnitud = case_when(magnitud == 1 ~ 'SO2',  magnitud == 6 ~ 'CO', magnitud == 7 ~ 'NO', magnitud == 8 ~ 'NO2', magnitud == 9 ~ 'PM2.5', magnitud == 10 ~ 'PM10', magnitud == 12 ~ 'NOx', magnitud == 14 ~ 'O3', magnitud == 20 ~ 'C7H8', magnitud == 22 ~ 'Carbon_Negro', magnitud == 30 ~ 'C6H6', magnitud == 42 ~ 'CHtot', magnitud == 44 ~ 'CHnoMet', magnitud == 431 ~ 'MPX'))


Calidad_Aire_Madrid <- 
  Calidad_Aire_Madrid %>% 
  select(-ano, -provincia, -municipio, -estacion, -punto_muestreo, -starts_with('v'))

across()

Calidad_Aire_Madrid$horas <- 
  apply(Calidad_Aire_Madrid[ ,c(4:27)], 1, mean, na.rm = TRUE)

View(Calidad_Aire_Madrid)
