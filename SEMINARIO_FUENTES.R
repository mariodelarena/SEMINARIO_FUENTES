library(readxl)
library(readr)
library(dplyr)

#Tabla de Altas Hospitalarias
Altas_Hospitalarias_Espana <- read_excel("INPUT/DATA/Altas_Hospitalarias.xls")
Altas_Hospitalarias_Espana <- Altas_Hospitalarias_Espana[6:157, ]
Altas_Hospitalarias_Espana <- Altas_Hospitalarias_Espana %>% select(1, 16, 17, 21, 46, 55)
Altas_Hospitalarias_Espana <- Altas_Hospitalarias_Espana[c(1,2,3,4,12,26,29,32,39,45,48,49,61,70,91,95,106,117,126,129,130,135,152 ),]
Altas_Hospitalarias_Espana <- rename(.data = Altas_Hospitalarias_Espana, Asturias = ...16, Baleares = ...17, Cantabria = ...21 )
Altas_Hospitalarias_Espana <- Altas_Hospitalarias_Espana[c(12:21),]

#Tabla de Altas Hospitalarias de Madrid
# Hay que quitar este Madrid y poner el que aparece ya en la tabla de altas hospitalarias
Altas_Hospitalarias_Madrid <- read_excel("INPUT/DATA/Altas_Hospitalarias_Madrid.xls", 
                                         sheet = "I.1.2")
Altas_Hospitalarias_Madrid <- Altas_Hospitalarias_Madrid[19:28, 1:2]
Altas_Hospitalarias_Madrid <- rename(.data = Altas_Hospitalarias_Madrid, Madrid = "9187" )
View(Altas_Hospitalarias_Madrid)

#Tabla con las Altas Hospitalarias + Madrid
Altas_Hospitalarias_Espana[, 5] <- Altas_Hospitalarias_Madrid[,2]
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

#Tabla de la calidad del aire de Cantabria ya editada
Calidad_Aire_Cantabria_Sin_Corte <- read_excel("INPUT/DATA/Calidad_Aire_Cantabria.xls")
Calidad_Aire_Cantabria2020 <-   Calidad_Aire_Cantabria_Sin_Corte[285, 2:67]

typeof(Calidad_Aire_Cantabria2020)
tapply(Calidad_Aire_Cantabria2020$`Territorio y Medio ambiente -> Medio ambiente -> Calidad del Aire`, Calidad_Aire_Cantabria2020$...8, mean)
Calidad_Aire_Cantabria2020[ , 1:66] <- as.data.frame(apply(Calidad_Aire_Cantabria2020[ , 1: 66], 2, as.numeric))
sapply(Calidad_Aire_Cantabria2020, class)




row.names(Calidad_Aire_Cantabria2020) <- c("Cantabria")

View(Calidad_Aire_Cantabria2020)

#Tabla de la calidad del aire de Madrid con el nombre de las magnitudes correcto
Calidad_Aire_Madrid <- read_delim("INPUT/DATA/Calidad_Aire_Madrid.csv", 
                                  delim = ";", escape_double = FALSE, trim_ws = TRUE)
Calidad_Aire_Madrid <- 
  mutate(Calidad_Aire_Madrid, magnitud = case_when(magnitud == 1 ~ 'SO2',  magnitud == 6 ~ 'CO', magnitud == 7 ~ 'NO', magnitud == 8 ~ 'NO2', magnitud == 9 ~ 'PM2.5', magnitud == 10 ~ 'PM10', magnitud == 12 ~ 'NOx', magnitud == 14 ~ 'O3', magnitud == 20 ~ 'C7H8', magnitud == 22 ~ 'Carbon_Negro', magnitud == 30 ~ 'C6H6', magnitud == 42 ~ 'CHtot', magnitud == 44 ~ 'CHnoMet', magnitud == 431 ~ 'MPX'))


Calidad_Aire_Madrid <- 
  Calidad_Aire_Madrid %>%
  group_by(magnitud, mes) %>%
  select(-ano, -provincia, -municipio, -estacion, -punto_muestreo, -starts_with('v'))%>%
  summarise(across(c(h01, h02, h03, h04, h05, h06, h07, h08, h09, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24), ~ mean(.x, na.rm = TRUE)))

View(Calidad_Aire_Madrid)

#Calidad_Aire_Madrid <- sumarise(across(where(starts_with("h")), ~ mean(.x, na.rm = TRUE)))


#Tabla de la calidad del aire de Valencia
Calidad_Aire_Valencia_sin_Corte <- read_delim("INPUT/DATA/Calidad_Aire_Valencia.csv", 
                                    delim = ";", escape_double = FALSE, trim_ws = TRUE)

Calidad_Aire_Valencia <- Calidad_Aire_Valencia_sin_Corte[31700:34993,6:19]
  
Calidad_Aire_Valencia <- Calidad_Aire_Valencia %>%
  select(-Ruido)%>%
  summarise(across(c(PM1, PM2.5, PM10, NO, NO2, NOx, O3, SO2, CO, NH3, C7H8, C6H6, C8H10), ~ mean(.x, na.rm = TRUE)))

View(Calidad_Aire_Valencia)

