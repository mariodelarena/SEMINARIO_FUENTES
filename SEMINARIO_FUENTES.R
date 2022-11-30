library(readxl)
library(readr)
library(dplyr)

#Tabla de Altas Hospitalarias
Altas_Hospitalarias_Espana <- read_excel("INPUT/DATA/Altas_Hospitalarias.xls")
Altas_Hospitalarias_Espana <- Altas_Hospitalarias_Espana[6:157, ]
Altas_Hospitalarias_Espana <- Altas_Hospitalarias_Espana %>% select(1, 16, 17, 21, 46, 55)
Altas_Hospitalarias_Espana <- Altas_Hospitalarias_Espana[c(1,2,3,4,12,26,29,32,39,45,48,49,61,70,91,95,106,117,126,129,130,135,152 ),]
Altas_Hospitalarias_Espana <- rename(.data = Altas_Hospitalarias_Espana, Asturias = ...16, Baleares = ...17, Cantabria = ...21, Valencia = ...46, Madrid = ...55)
Altas_Hospitalarias_Espana <- Altas_Hospitalarias_Espana[c(12:21),]

View(Altas_Hospitalarias_Espana)


#Tabla de la calidad del aire de la Palma
Calidad_Aire_Palma2020 <- read_excel("INPUT/DATA/Calidad_Aire_Palma.xls")
Calidad_Aire_Palma2020 <- Calidad_Aire_Palma2020 %>% 
  select(-PERIODO_HI, -starts_with('FL')) %>%
  summarise(across(c(SO2_HI, NO_HI, NO2_HI, O3_HI, PM10_HI, DD_HI, VV_HI, TMP_HI, HR_HI, RS_HI, PRB_HI, LL_HI), ~ mean(.x, na.rm = TRUE)))
Calidad_Aire_Palma2020 <- rename(.data = Calidad_Aire_Palma2020, SO2 = SO2_HI, NO = NO_HI, NO2 = NO2_HI, O3 = O3_HI, PM10 = PM10_HI, DD = DD_HI, VV = VV_HI, TMP = TMP_HI, HR = HR_HI, RS = RS_HI, PBR = PRB_HI, LL = LL_HI)

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

Calidad_Aire_Cantabria2020$PM10 <- mean(as.numeric(c(Calidad_Aire_Cantabria2020$`Territorio y Medio ambiente -> Medio ambiente -> Calidad del Aire`, Calidad_Aire_Cantabria2020$...8, Calidad_Aire_Cantabria2020$...14,Calidad_Aire_Cantabria2020$...20, Calidad_Aire_Cantabria2020$...26, Calidad_Aire_Cantabria2020$...32, Calidad_Aire_Cantabria2020$...38, Calidad_Aire_Cantabria2020$...44, Calidad_Aire_Cantabria2020$...50, Calidad_Aire_Cantabria2020$...56, Calidad_Aire_Cantabria2020$...62)), na.rm = TRUE)

Calidad_Aire_Cantabria2020$SO2 <- mean(as.numeric(c(Calidad_Aire_Cantabria2020$...3, Calidad_Aire_Cantabria2020$...9, Calidad_Aire_Cantabria2020$...15,Calidad_Aire_Cantabria2020$...21, Calidad_Aire_Cantabria2020$...27, Calidad_Aire_Cantabria2020$...33, Calidad_Aire_Cantabria2020$...39, Calidad_Aire_Cantabria2020$...45, Calidad_Aire_Cantabria2020$...51, Calidad_Aire_Cantabria2020$...57, Calidad_Aire_Cantabria2020$...63)), na.rm = TRUE)
numeric_list <- as.numeric(Calidad_Aire_Cantabria2020)

Calidad_Aire_Cantabria2020$NO2 <- mean(as.numeric(c(Calidad_Aire_Cantabria2020$...4, Calidad_Aire_Cantabria2020$...10, Calidad_Aire_Cantabria2020$...16,Calidad_Aire_Cantabria2020$...22, Calidad_Aire_Cantabria2020$...28, Calidad_Aire_Cantabria2020$...34, Calidad_Aire_Cantabria2020$...40, Calidad_Aire_Cantabria2020$...46, Calidad_Aire_Cantabria2020$...52, Calidad_Aire_Cantabria2020$...58, Calidad_Aire_Cantabria2020$...64)), na.rm = TRUE)

Calidad_Aire_Cantabria2020$NO <- mean(as.numeric(c(Calidad_Aire_Cantabria2020$...5, Calidad_Aire_Cantabria2020$...11, Calidad_Aire_Cantabria2020$...17,Calidad_Aire_Cantabria2020$...23, Calidad_Aire_Cantabria2020$...29, Calidad_Aire_Cantabria2020$...35, Calidad_Aire_Cantabria2020$...41, Calidad_Aire_Cantabria2020$...47, Calidad_Aire_Cantabria2020$...53, Calidad_Aire_Cantabria2020$...59, Calidad_Aire_Cantabria2020$...65)), na.rm = TRUE)
Calidad_Aire_Cantabria2020 <- numeric_list

Calidad_Aire_Cantabria2020$CO <- mean(as.numeric(c(Calidad_Aire_Cantabria2020$...6, Calidad_Aire_Cantabria2020$...12, Calidad_Aire_Cantabria2020$...18,Calidad_Aire_Cantabria2020$...24, Calidad_Aire_Cantabria2020$...30, Calidad_Aire_Cantabria2020$...36, Calidad_Aire_Cantabria2020$...42, Calidad_Aire_Cantabria2020$...48, Calidad_Aire_Cantabria2020$...54, Calidad_Aire_Cantabria2020$...60, Calidad_Aire_Cantabria2020$...66)), na.rm = TRUE)

Calidad_Aire_Cantabria2020$O3 <- mean(as.numeric(c(Calidad_Aire_Cantabria2020$...7, Calidad_Aire_Cantabria2020$...13, Calidad_Aire_Cantabria2020$...19,Calidad_Aire_Cantabria2020$...25, Calidad_Aire_Cantabria2020$...31, Calidad_Aire_Cantabria2020$...37, Calidad_Aire_Cantabria2020$...43, Calidad_Aire_Cantabria2020$...49, Calidad_Aire_Cantabria2020$...55, Calidad_Aire_Cantabria2020$...61, Calidad_Aire_Cantabria2020$...67)), na.rm = TRUE)

Calidad_Aire_Cantabria2020 <- Calidad_Aire_Cantabria2020 %>%
  select(PM10, SO2, NO2, NO, CO, O3)

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

Calidad_Aire_Valencia <- as.data.frame(Calidad_Aire_Valencia)
row.names(Calidad_Aire_Valencia) <- c("Valencia")
View(Calidad_Aire_Valencia)

