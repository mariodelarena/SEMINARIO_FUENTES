library(readxl)
library(readr)
library(dplyr)

#Tabla de Altas Hospitalarias
Altas_Hospitalarias_Espana <- read_excel("INPUT/DATA/Altas_Hospitalarias.xls")
Altas_Hospitalarias_Espana <- Altas_Hospitalarias_Espana[6:157, ]
Altas_Hospitalarias_Espana <- Altas_Hospitalarias_Espana %>% select(1, 12, 16, 17, 21)
Altas_Hospitalarias_Espana <- Altas_Hospitalarias_Espana[c(1,2,3,4,12,26,29,32,39,45,48,49,61,70,91,95,106,117,126,129,130,135,152 ),]
Altas_Hospitalarias_Espana <- rename(.data = Altas_Hospitalarias_Espana, Aragón = ...12, Asturias = ...16, Baleares = ...17, Cantabria = ...21 )
Altas_Hospitalarias_Espana <- Altas_Hospitalarias_Espana[c(12:21),]

#Tabla de Altas Hospitalarias de Madrid
Altas_Hospitalarias_Madrid <- read_excel("INPUT/DATA/Altas_Hospitalarias_Madrid.xls", 
                                         sheet = "I.1.2")
Altas_Hospitalarias_Madrid <- Altas_Hospitalarias_Madrid[19:28, 1:2]
Altas_Hospitalarias_Madrid <- rename(.data = Altas_Hospitalarias_Madrid, Madrid = "9187" )
View(Altas_Hospitalarias_Madrid)

#Tabla con las Altas Hospitalarias + Madrid
Altas_Hospitalarias_Espana[, 6] <- Altas_Hospitalarias_Madrid[,2]
View(Altas_Hospitalarias_Espana)


#Tabla de la calidad del aire de la Palma
Calidad_Aire_Palma2020 <- read_excel("INPUT/DATA/Calidad_Aire_Palma.xls")
Calidad_Aire_Palma2020 <- Calidad_Aire_Palma2020 %>% 
  select(-PERIODO_HI, -starts_with('FL')) %>%
  summarise(across(c(SO2_HI, NO_HI, NO2_HI, O3_HI, PM10_HI, DD_HI, VV_HI, TMP_HI, HR_HI, RS_HI, PRB_HI, LL_HI), ~ mean(.x, na.rm = TRUE)))

Calidad_Aire_Palma2020 <- as.data.frame(Calidad_Aire_Palma2020)
row.names(Calidad_Aire_Palma2020) <- c("Palma")

View(Calidad_Aire_Palma2020)

#Tabla de la calidad del aire de Gijón
Calidad_Aire_Gijon <- read_delim("INPUT/DATA/Calidad_Aire_Gijon.csv", 
                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
Calidad_Aire_Gijon <- Calidad_Aire_Gijon %>% select(-Estacion, -Titulo, -latitud, -longitud, -Periodo)%>%
  summarise(across(c(SO2, NO, NO2, O3, PM10, dd, vv, TMP, HR, RS, PRB, LL, BEN, TOL, MXIL, PM25), ~ mean(.x, na.rm = TRUE)))

Calidad_Aire_Gijon <- as.data.frame(Calidad_Aire_Gijon)
row.names(Calidad_Aire_Gijon) <- c("Gijón")
View(Calidad_Aire_Gijon)

#Tabla de la calidad del aire de Aragón
Calidad_Aire_Aragon <- read_excel("INPUT/DATA/Calidad_aire_Aragon.xlsx")
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

#Calidad_Aire_Madrid <- sumarise(across(where(starts_with("h")), ~ mean(.x, na.rm = TRUE)))

Calidad_Aire_Madrid$horas <- 
  apply(Calidad_Aire_Madrid[ ,c(4:27)], 1, mean, na.rm = TRUE)

View(Calidad_Aire_Madrid)
