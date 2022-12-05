library(readxl)
library(readr)
library(dplyr)
library(tidyverse)

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

Calidad_Aire_Palma2020 <- Calidad_Aire_Palma2020 %>%
  select(PM10, SO2, NO2, NO, O3)

View(Calidad_Aire_Palma2020)


#Tabla de la calidad del aire de Gijón
Calidad_Aire_Gijon <- read_delim("INPUT/DATA/Calidad_Aire_Gijon.csv", 
                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
Calidad_Aire_Gijon <- Calidad_Aire_Gijon %>% select(-Estacion, -Titulo, -latitud, -longitud, -Periodo)%>%
  summarise(across(c(SO2, NO, NO2, O3, PM10, dd, vv, TMP, HR, RS, PRB, LL, BEN, TOL, MXIL, PM25), ~ mean(.x, na.rm = TRUE)))

Calidad_Aire_Gijon <- as.data.frame(Calidad_Aire_Gijon)
row.names(Calidad_Aire_Gijon) <- c("Gijón")

Calidad_Aire_Gijon <- Calidad_Aire_Gijon %>%
  select(PM10, SO2, NO2, NO, O3)

View(Calidad_Aire_Gijon)


#Tabla de la calidad del aire de Cantabria ya editada
Calidad_Aire_Cantabria_Sin_Corte <- read_excel("INPUT/DATA/Calidad_Aire_Cantabria.xls")
Calidad_Aire_Cantabria2020 <-   Calidad_Aire_Cantabria_Sin_Corte[285, 2:67]

Calidad_Aire_Cantabria2020$PM10 <- mean(as.numeric(c(Calidad_Aire_Cantabria2020$`Territorio y Medio ambiente -> Medio ambiente -> Calidad del Aire`, Calidad_Aire_Cantabria2020$...8, Calidad_Aire_Cantabria2020$...14,Calidad_Aire_Cantabria2020$...20, Calidad_Aire_Cantabria2020$...26, Calidad_Aire_Cantabria2020$...32, Calidad_Aire_Cantabria2020$...38, Calidad_Aire_Cantabria2020$...44, Calidad_Aire_Cantabria2020$...50, Calidad_Aire_Cantabria2020$...56, Calidad_Aire_Cantabria2020$...62)), na.rm = TRUE)

Calidad_Aire_Cantabria2020$SO2 <- mean(as.numeric(c(Calidad_Aire_Cantabria2020$...3, Calidad_Aire_Cantabria2020$...9, Calidad_Aire_Cantabria2020$...15,Calidad_Aire_Cantabria2020$...21, Calidad_Aire_Cantabria2020$...27, Calidad_Aire_Cantabria2020$...33, Calidad_Aire_Cantabria2020$...39, Calidad_Aire_Cantabria2020$...45, Calidad_Aire_Cantabria2020$...51, Calidad_Aire_Cantabria2020$...57, Calidad_Aire_Cantabria2020$...63)), na.rm = TRUE)

Calidad_Aire_Cantabria2020$NO2 <- mean(as.numeric(c(Calidad_Aire_Cantabria2020$...4, Calidad_Aire_Cantabria2020$...10, Calidad_Aire_Cantabria2020$...16,Calidad_Aire_Cantabria2020$...22, Calidad_Aire_Cantabria2020$...28, Calidad_Aire_Cantabria2020$...34, Calidad_Aire_Cantabria2020$...40, Calidad_Aire_Cantabria2020$...46, Calidad_Aire_Cantabria2020$...52, Calidad_Aire_Cantabria2020$...58, Calidad_Aire_Cantabria2020$...64)), na.rm = TRUE)

Calidad_Aire_Cantabria2020$NO <- mean(as.numeric(c(Calidad_Aire_Cantabria2020$...5, Calidad_Aire_Cantabria2020$...11, Calidad_Aire_Cantabria2020$...17,Calidad_Aire_Cantabria2020$...23, Calidad_Aire_Cantabria2020$...29, Calidad_Aire_Cantabria2020$...35, Calidad_Aire_Cantabria2020$...41, Calidad_Aire_Cantabria2020$...47, Calidad_Aire_Cantabria2020$...53, Calidad_Aire_Cantabria2020$...59, Calidad_Aire_Cantabria2020$...65)), na.rm = TRUE)

Calidad_Aire_Cantabria2020$CO <- mean(as.numeric(c(Calidad_Aire_Cantabria2020$...6, Calidad_Aire_Cantabria2020$...12, Calidad_Aire_Cantabria2020$...18,Calidad_Aire_Cantabria2020$...24, Calidad_Aire_Cantabria2020$...30, Calidad_Aire_Cantabria2020$...36, Calidad_Aire_Cantabria2020$...42, Calidad_Aire_Cantabria2020$...48, Calidad_Aire_Cantabria2020$...54, Calidad_Aire_Cantabria2020$...60, Calidad_Aire_Cantabria2020$...66)), na.rm = TRUE)

Calidad_Aire_Cantabria2020$O3 <- mean(as.numeric(c(Calidad_Aire_Cantabria2020$...7, Calidad_Aire_Cantabria2020$...13, Calidad_Aire_Cantabria2020$...19,Calidad_Aire_Cantabria2020$...25, Calidad_Aire_Cantabria2020$...31, Calidad_Aire_Cantabria2020$...37, Calidad_Aire_Cantabria2020$...43, Calidad_Aire_Cantabria2020$...49, Calidad_Aire_Cantabria2020$...55, Calidad_Aire_Cantabria2020$...61, Calidad_Aire_Cantabria2020$...67)), na.rm = TRUE)

Calidad_Aire_Cantabria2020 <- Calidad_Aire_Cantabria2020 %>%
  select(PM10, SO2, NO2, NO, O3)

row.names(Calidad_Aire_Cantabria2020) <- c("Cantabria")


View(Calidad_Aire_Cantabria2020)


#Tabla de la calidad del aire de Madrid con el nombre de las magnitudes correcto
Calidad_Aire_Madrid <- read_delim("INPUT/DATA/Calidad_Aire_Madrid.csv", 
                                  delim = ";", escape_double = FALSE, trim_ws = TRUE)

Calidad_Aire_Madrid <- 
  mutate(Calidad_Aire_Madrid, magnitud = case_when(magnitud == 1 ~ 'SO2',  magnitud == 6 ~ 'CO', magnitud == 7 ~ 'NO', magnitud == 8 ~ 'NO2', magnitud == 9 ~ 'PM2.5', magnitud == 10 ~ 'PM10', magnitud == 12 ~ 'NOx', magnitud == 14 ~ 'O3', magnitud == 20 ~ 'C7H8', magnitud == 22 ~ 'Carbon_Negro', magnitud == 30 ~ 'C6H6', magnitud == 42 ~ 'CHtot', magnitud == 44 ~ 'CHnoMet', magnitud == 431 ~ 'MPX'))

Calidad_Aire_Madrid <- Calidad_Aire_Madrid %>%
  select(magnitud, starts_with("h"))

Calidad_Aire_Madrid <- Calidad_Aire_Madrid %>%
  group_by(magnitud) %>%
  summarise(across(c(h01, h02, h03, h04, h05, h06, h07, h08, h09, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24), ~ mean(.x, na.rm = TRUE)))

Calidad_Aire_Madrid_Ajustado <- data.frame(
  C6H6 = mean(c(Calidad_Aire_Madrid[1, ]$h01, Calidad_Aire_Madrid[1, ]$h02, Calidad_Aire_Madrid[1, ]$h03, Calidad_Aire_Madrid[1, ]$h04, Calidad_Aire_Madrid[1, ]$h05, Calidad_Aire_Madrid[1, ]$h06, Calidad_Aire_Madrid[1, ]$h07, Calidad_Aire_Madrid[1, ]$h08, Calidad_Aire_Madrid[1, ]$h09, Calidad_Aire_Madrid[1, ]$h10, Calidad_Aire_Madrid[1, ]$h11, Calidad_Aire_Madrid[1, ]$h12, Calidad_Aire_Madrid[1, ]$h13, Calidad_Aire_Madrid[1, ]$h14, Calidad_Aire_Madrid[1, ]$h15, Calidad_Aire_Madrid[1, ]$h16, Calidad_Aire_Madrid[1, ]$h17, Calidad_Aire_Madrid[1, ]$h18, Calidad_Aire_Madrid[1, ]$h19, Calidad_Aire_Madrid[1, ]$h20, Calidad_Aire_Madrid[1, ]$h21, Calidad_Aire_Madrid[1, ]$h22, Calidad_Aire_Madrid[1, ]$h23, Calidad_Aire_Madrid[1, ]$h24), na.rm = TRUE),

  C7H8 = mean(c(Calidad_Aire_Madrid[2, ]$h01, Calidad_Aire_Madrid[2, ]$h02, Calidad_Aire_Madrid[2, ]$h03, Calidad_Aire_Madrid[2, ]$h04, Calidad_Aire_Madrid[2, ]$h05, Calidad_Aire_Madrid[2, ]$h06, Calidad_Aire_Madrid[2, ]$h07, Calidad_Aire_Madrid[2, ]$h08, Calidad_Aire_Madrid[2, ]$h09, Calidad_Aire_Madrid[2, ]$h10, Calidad_Aire_Madrid[2, ]$h11, Calidad_Aire_Madrid[2, ]$h12, Calidad_Aire_Madrid[2, ]$h13, Calidad_Aire_Madrid[2, ]$h14, Calidad_Aire_Madrid[2, ]$h15, Calidad_Aire_Madrid[2, ]$h16, Calidad_Aire_Madrid[2, ]$h17, Calidad_Aire_Madrid[2, ]$h18, Calidad_Aire_Madrid[2, ]$h19, Calidad_Aire_Madrid[2, ]$h20, Calidad_Aire_Madrid[2, ]$h21, Calidad_Aire_Madrid[2, ]$h22, Calidad_Aire_Madrid[2, ]$h23, Calidad_Aire_Madrid[2, ]$h24), na.rm = TRUE),

  CHnoMet = mean(c(Calidad_Aire_Madrid[3, ]$h01, Calidad_Aire_Madrid[3, ]$h02, Calidad_Aire_Madrid[3, ]$h03, Calidad_Aire_Madrid[3, ]$h04, Calidad_Aire_Madrid[3, ]$h05, Calidad_Aire_Madrid[3, ]$h06, Calidad_Aire_Madrid[3, ]$h07, Calidad_Aire_Madrid[3, ]$h08, Calidad_Aire_Madrid[3, ]$h09, Calidad_Aire_Madrid[3, ]$h10, Calidad_Aire_Madrid[3, ]$h11, Calidad_Aire_Madrid[3, ]$h12, Calidad_Aire_Madrid[3, ]$h13, Calidad_Aire_Madrid[3, ]$h14, Calidad_Aire_Madrid[3, ]$h15, Calidad_Aire_Madrid[3, ]$h16, Calidad_Aire_Madrid[3, ]$h17, Calidad_Aire_Madrid[3, ]$h18, Calidad_Aire_Madrid[3, ]$h19, Calidad_Aire_Madrid[3, ]$h20, Calidad_Aire_Madrid[3, ]$h21, Calidad_Aire_Madrid[3, ]$h22, Calidad_Aire_Madrid[3, ]$h23, Calidad_Aire_Madrid[3, ]$h24), na.rm = TRUE),
  
  CHtot = mean(c(Calidad_Aire_Madrid[4, ]$h01, Calidad_Aire_Madrid[4, ]$h02, Calidad_Aire_Madrid[4, ]$h03, Calidad_Aire_Madrid[4, ]$h04, Calidad_Aire_Madrid[4, ]$h05, Calidad_Aire_Madrid[4, ]$h06, Calidad_Aire_Madrid[4, ]$h07, Calidad_Aire_Madrid[4, ]$h08, Calidad_Aire_Madrid[4, ]$h09, Calidad_Aire_Madrid[4, ]$h10, Calidad_Aire_Madrid[4, ]$h11, Calidad_Aire_Madrid[4, ]$h12, Calidad_Aire_Madrid[4, ]$h13, Calidad_Aire_Madrid[4, ]$h14, Calidad_Aire_Madrid[4, ]$h15, Calidad_Aire_Madrid[4, ]$h16, Calidad_Aire_Madrid[4, ]$h17, Calidad_Aire_Madrid[4, ]$h18, Calidad_Aire_Madrid[4, ]$h19, Calidad_Aire_Madrid[4, ]$h20, Calidad_Aire_Madrid[4, ]$h21, Calidad_Aire_Madrid[4, ]$h22, Calidad_Aire_Madrid[4, ]$h23, Calidad_Aire_Madrid[4, ]$h24), na.rm = TRUE),
  
  CO = mean(c(Calidad_Aire_Madrid[5, ]$h01, Calidad_Aire_Madrid[5, ]$h02, Calidad_Aire_Madrid[5, ]$h03, Calidad_Aire_Madrid[5, ]$h04, Calidad_Aire_Madrid[5, ]$h05, Calidad_Aire_Madrid[5, ]$h06, Calidad_Aire_Madrid[5, ]$h07, Calidad_Aire_Madrid[5, ]$h08, Calidad_Aire_Madrid[5, ]$h09, Calidad_Aire_Madrid[5, ]$h10, Calidad_Aire_Madrid[5, ]$h11, Calidad_Aire_Madrid[5, ]$h12, Calidad_Aire_Madrid[5, ]$h13, Calidad_Aire_Madrid[5, ]$h14, Calidad_Aire_Madrid[5, ]$h15, Calidad_Aire_Madrid[5, ]$h16, Calidad_Aire_Madrid[5, ]$h17, Calidad_Aire_Madrid[5, ]$h18, Calidad_Aire_Madrid[5, ]$h19, Calidad_Aire_Madrid[5, ]$h20, Calidad_Aire_Madrid[5, ]$h21, Calidad_Aire_Madrid[5, ]$h22, Calidad_Aire_Madrid[5, ]$h23, Calidad_Aire_Madrid[5, ]$h24), na.rm = TRUE),
  
  MPX = mean(c(Calidad_Aire_Madrid[6, ]$h01, Calidad_Aire_Madrid[6, ]$h02, Calidad_Aire_Madrid[6, ]$h03, Calidad_Aire_Madrid[6, ]$h04, Calidad_Aire_Madrid[6, ]$h05, Calidad_Aire_Madrid[6, ]$h06, Calidad_Aire_Madrid[6, ]$h07, Calidad_Aire_Madrid[6, ]$h08, Calidad_Aire_Madrid[6, ]$h09, Calidad_Aire_Madrid[6, ]$h10, Calidad_Aire_Madrid[6, ]$h11, Calidad_Aire_Madrid[6, ]$h12, Calidad_Aire_Madrid[6, ]$h13, Calidad_Aire_Madrid[6, ]$h14, Calidad_Aire_Madrid[6, ]$h15, Calidad_Aire_Madrid[6, ]$h16, Calidad_Aire_Madrid[6, ]$h17, Calidad_Aire_Madrid[6, ]$h18, Calidad_Aire_Madrid[6, ]$h19, Calidad_Aire_Madrid[6, ]$h20, Calidad_Aire_Madrid[6, ]$h21, Calidad_Aire_Madrid[6, ]$h22, Calidad_Aire_Madrid[6, ]$h23, Calidad_Aire_Madrid[6, ]$h24), na.rm = TRUE),
  
  NO = mean(c(Calidad_Aire_Madrid[7, ]$h01, Calidad_Aire_Madrid[7, ]$h02, Calidad_Aire_Madrid[7, ]$h03, Calidad_Aire_Madrid[7, ]$h04, Calidad_Aire_Madrid[7, ]$h05, Calidad_Aire_Madrid[7, ]$h06, Calidad_Aire_Madrid[7, ]$h07, Calidad_Aire_Madrid[7, ]$h08, Calidad_Aire_Madrid[7, ]$h09, Calidad_Aire_Madrid[7, ]$h10, Calidad_Aire_Madrid[7, ]$h11, Calidad_Aire_Madrid[7, ]$h12, Calidad_Aire_Madrid[7, ]$h13, Calidad_Aire_Madrid[7, ]$h14, Calidad_Aire_Madrid[7, ]$h15, Calidad_Aire_Madrid[7, ]$h16, Calidad_Aire_Madrid[7, ]$h17, Calidad_Aire_Madrid[7, ]$h18, Calidad_Aire_Madrid[7, ]$h19, Calidad_Aire_Madrid[7, ]$h20, Calidad_Aire_Madrid[7, ]$h21, Calidad_Aire_Madrid[7, ]$h22, Calidad_Aire_Madrid[7, ]$h23, Calidad_Aire_Madrid[7, ]$h24), na.rm = TRUE),
  
  NO2 = mean(c(Calidad_Aire_Madrid[8, ]$h01, Calidad_Aire_Madrid[8, ]$h02, Calidad_Aire_Madrid[8, ]$h03, Calidad_Aire_Madrid[8, ]$h04, Calidad_Aire_Madrid[8, ]$h05, Calidad_Aire_Madrid[8, ]$h06, Calidad_Aire_Madrid[8, ]$h07, Calidad_Aire_Madrid[8, ]$h08, Calidad_Aire_Madrid[8, ]$h09, Calidad_Aire_Madrid[8, ]$h10, Calidad_Aire_Madrid[8, ]$h11, Calidad_Aire_Madrid[8, ]$h12, Calidad_Aire_Madrid[8, ]$h13, Calidad_Aire_Madrid[8, ]$h14, Calidad_Aire_Madrid[8, ]$h15, Calidad_Aire_Madrid[8, ]$h16, Calidad_Aire_Madrid[8, ]$h17, Calidad_Aire_Madrid[8, ]$h18, Calidad_Aire_Madrid[8, ]$h19, Calidad_Aire_Madrid[8, ]$h20, Calidad_Aire_Madrid[8, ]$h21, Calidad_Aire_Madrid[8, ]$h22, Calidad_Aire_Madrid[8, ]$h23, Calidad_Aire_Madrid[8, ]$h24), na.rm = TRUE),
  
  NOx = mean(c(Calidad_Aire_Madrid[9, ]$h01, Calidad_Aire_Madrid[9, ]$h02, Calidad_Aire_Madrid[9, ]$h03, Calidad_Aire_Madrid[9, ]$h04, Calidad_Aire_Madrid[9, ]$h05, Calidad_Aire_Madrid[9, ]$h06, Calidad_Aire_Madrid[1, ]$h07, Calidad_Aire_Madrid[9, ]$h08, Calidad_Aire_Madrid[9, ]$h09, Calidad_Aire_Madrid[9, ]$h10, Calidad_Aire_Madrid[1, ]$h11, Calidad_Aire_Madrid[9, ]$h12, Calidad_Aire_Madrid[9, ]$h13, Calidad_Aire_Madrid[9, ]$h14, Calidad_Aire_Madrid[1, ]$h15, Calidad_Aire_Madrid[9, ]$h16, Calidad_Aire_Madrid[9, ]$h17, Calidad_Aire_Madrid[9, ]$h18, Calidad_Aire_Madrid[1, ]$h19, Calidad_Aire_Madrid[9, ]$h20, Calidad_Aire_Madrid[9, ]$h21, Calidad_Aire_Madrid[9, ]$h22, Calidad_Aire_Madrid[1, ]$h23, Calidad_Aire_Madrid[9, ]$h24), na.rm = TRUE),
  
  O3 = mean(c(Calidad_Aire_Madrid[10, ]$h01, Calidad_Aire_Madrid[10, ]$h02, Calidad_Aire_Madrid[10, ]$h03, Calidad_Aire_Madrid[10, ]$h04, Calidad_Aire_Madrid[10, ]$h05, Calidad_Aire_Madrid[10, ]$h06, Calidad_Aire_Madrid[10, ]$h07, Calidad_Aire_Madrid[10, ]$h08, Calidad_Aire_Madrid[10, ]$h09, Calidad_Aire_Madrid[10, ]$h10, Calidad_Aire_Madrid[10, ]$h11, Calidad_Aire_Madrid[10, ]$h12, Calidad_Aire_Madrid[10, ]$h13, Calidad_Aire_Madrid[10, ]$h14, Calidad_Aire_Madrid[10, ]$h15, Calidad_Aire_Madrid[10, ]$h16, Calidad_Aire_Madrid[10, ]$h17, Calidad_Aire_Madrid[10, ]$h18, Calidad_Aire_Madrid[10, ]$h19, Calidad_Aire_Madrid[10, ]$h20, Calidad_Aire_Madrid[10, ]$h21, Calidad_Aire_Madrid[10, ]$h22, Calidad_Aire_Madrid[10, ]$h23, Calidad_Aire_Madrid[10, ]$h24), na.rm = TRUE),
  
  PM10 = mean(c(Calidad_Aire_Madrid[11, ]$h01, Calidad_Aire_Madrid[11, ]$h02, Calidad_Aire_Madrid[11, ]$h03, Calidad_Aire_Madrid[11, ]$h04, Calidad_Aire_Madrid[11, ]$h05, Calidad_Aire_Madrid[11, ]$h06, Calidad_Aire_Madrid[11, ]$h07, Calidad_Aire_Madrid[11, ]$h08, Calidad_Aire_Madrid[11, ]$h09, Calidad_Aire_Madrid[11, ]$h10, Calidad_Aire_Madrid[11, ]$h11, Calidad_Aire_Madrid[11, ]$h12, Calidad_Aire_Madrid[11, ]$h13, Calidad_Aire_Madrid[11, ]$h14, Calidad_Aire_Madrid[11, ]$h15, Calidad_Aire_Madrid[11, ]$h16, Calidad_Aire_Madrid[11, ]$h17, Calidad_Aire_Madrid[11, ]$h18, Calidad_Aire_Madrid[11, ]$h19, Calidad_Aire_Madrid[11, ]$h20, Calidad_Aire_Madrid[11, ]$h21, Calidad_Aire_Madrid[11, ]$h22, Calidad_Aire_Madrid[11, ]$h23, Calidad_Aire_Madrid[11, ]$h24), na.rm = TRUE),
  
  PM2.5 = mean(c(Calidad_Aire_Madrid[12, ]$h01, Calidad_Aire_Madrid[12, ]$h02, Calidad_Aire_Madrid[12, ]$h03, Calidad_Aire_Madrid[12, ]$h04, Calidad_Aire_Madrid[12, ]$h05, Calidad_Aire_Madrid[12, ]$h06, Calidad_Aire_Madrid[12, ]$h07, Calidad_Aire_Madrid[12, ]$h08, Calidad_Aire_Madrid[12, ]$h09, Calidad_Aire_Madrid[12, ]$h10, Calidad_Aire_Madrid[12, ]$h11, Calidad_Aire_Madrid[12, ]$h12, Calidad_Aire_Madrid[12, ]$h13, Calidad_Aire_Madrid[12, ]$h14, Calidad_Aire_Madrid[12, ]$h15, Calidad_Aire_Madrid[12, ]$h16, Calidad_Aire_Madrid[12, ]$h17, Calidad_Aire_Madrid[12, ]$h18, Calidad_Aire_Madrid[12, ]$h19, Calidad_Aire_Madrid[12, ]$h20, Calidad_Aire_Madrid[12, ]$h21, Calidad_Aire_Madrid[12, ]$h22, Calidad_Aire_Madrid[12, ]$h23, Calidad_Aire_Madrid[12, ]$h24), na.rm = TRUE),
  
  SO2 = mean(c(Calidad_Aire_Madrid[13, ]$h01, Calidad_Aire_Madrid[13, ]$h02, Calidad_Aire_Madrid[13, ]$h03, Calidad_Aire_Madrid[13, ]$h04, Calidad_Aire_Madrid[13, ]$h05, Calidad_Aire_Madrid[13, ]$h06, Calidad_Aire_Madrid[13, ]$h07, Calidad_Aire_Madrid[13, ]$h08, Calidad_Aire_Madrid[13, ]$h09, Calidad_Aire_Madrid[13, ]$h10, Calidad_Aire_Madrid[13, ]$h11, Calidad_Aire_Madrid[13, ]$h12, Calidad_Aire_Madrid[13, ]$h13, Calidad_Aire_Madrid[13, ]$h14, Calidad_Aire_Madrid[13, ]$h15, Calidad_Aire_Madrid[13, ]$h16, Calidad_Aire_Madrid[13, ]$h17, Calidad_Aire_Madrid[13, ]$h18, Calidad_Aire_Madrid[13, ]$h19, Calidad_Aire_Madrid[13, ]$h20, Calidad_Aire_Madrid[13, ]$h21, Calidad_Aire_Madrid[13, ]$h22, Calidad_Aire_Madrid[13, ]$h23, Calidad_Aire_Madrid[13, ]$h24), na.rm = TRUE))

Calidad_Aire_Madrid_Ajustado <- Calidad_Aire_Madrid_Ajustado %>%
  select(PM10, SO2, NO2, NO, O3)

row.names(Calidad_Aire_Madrid_Ajustado) <- c("Madrid")

View(Calidad_Aire_Madrid_Ajustado)


#Tabla de la calidad del aire de Valencia
Calidad_Aire_Valencia_sin_Corte <- read_delim("INPUT/DATA/Calidad_Aire_Valencia.csv", 
                                    delim = ";", escape_double = FALSE, trim_ws = TRUE)

Calidad_Aire_Valencia <- Calidad_Aire_Valencia_sin_Corte[31700:34993,6:19]
  
Calidad_Aire_Valencia <- Calidad_Aire_Valencia %>%
  select(-Ruido)%>%
  summarise(across(c(PM1, PM2.5, PM10, NO, NO2, NOx, O3, SO2, CO, NH3, C7H8, C6H6, C8H10), ~ mean(.x, na.rm = TRUE)))

Calidad_Aire_Valencia <- as.data.frame(Calidad_Aire_Valencia)
row.names(Calidad_Aire_Valencia) <- c("Valencia")

Calidad_Aire_Valencia <- Calidad_Aire_Valencia %>%
  select(PM10, SO2, NO2, NO, O3)

View(Calidad_Aire_Valencia)

#Tabla calidades aire España

datos_Palma <- data.frame(Calidad_Aire_Palma2020)
datos_Gijon <- data.frame(Calidad_Aire_Gijon)
datos_Cantabria <- data.frame(Calidad_Aire_Cantabria2020)
datos_Valencia <- data.frame(Calidad_Aire_Valencia)
datos_Madrid <- data.frame(Calidad_Aire_Madrid_Ajustado)
datos <- rbind(datos_Palma, datos_Gijon)
datos <- rbind(datos, datos_Cantabria)
datos <- rbind(datos, datos_Valencia)
datos <- rbind(datos, datos_Madrid)

row.names(datos)[row.names(datos) == 1] <- "Cantabria"

View(datos)

#Gráficos

##Altas por comunidad

###Ajuste tabla
Altas_Grafico1 <- Altas_Hospitalarias_Espana %>%
  pivot_longer(Asturias:Madrid, names_to = "CCAA", values_to = "Numero altas")
Altas_Grafico1$`Numero altas` <- as.numeric(Altas_Grafico1$`Numero altas`)
colnames(Altas_Grafico1)[colnames(Altas_Grafico1) == "Año 2020"] <- "Enfermedades"


print(Altas_Grafico1)


ggplot(data = Altas_Grafico1, aes(x = CCAA, y = `Numero altas`)) +
  geom_bar(stat = "identity", aes(fill = Enfermedades))



