# ----
# title: topicos avancados em programacao em R
# author: mauricio vancine
# date: 2025-10-29
# ----

# table -------------------------------------------------------------------

## carregue os dados do palmerpenguins
library(palmerpenguins)

## exercicio 01 ----
# Qual é a frequencia absolulta e relativa de cada espécie?
table(penguins$species)
prop.table(table(penguins$species))

## exercicio 02 ----
# Qual é a frequencia absolulta e relativa de pinguins machos e fêmeas?
table(penguins$sex)
prop.table(table(penguins$sex))

## exercicio 03 ----
# Quantos pinguins Adelie são machos? E quantas fêmeas da espécie Gentoo?
table(penguins$species, penguins$sex)

## exercicio 04 ----
# Qual ilha tem a maior quantidade de pinguins?
table(penguins$island)

## exercicio 05 ----
# Em qual ilha a espécie Gentoo é mais abundante?
# E onde Adelie tem a maior concentração?
table(penguins$species, penguins$island)

## exercicio 06 ----
# Em qual ilha há o maior número de pinguins machos?
table(penguins$island, penguins$sex)

## exercicio 07 ----
# Quantos pinguins fêmeas da espécie Chinstrap estão presentes na ilha Dream?
table(penguins$species, penguins$island, penguins$sex)

## exercicio 08 ----
# Usando o pacote janitor e a função tabyl, crie uma tabela de frequência de 
# espécie e sexo 
library(janitor)
janitor::tabyl(penguins, species, sex)

## exercicio 09 ----
# Usando o pacote janitor e a função tabyl, crie uma tabela de frequência de 
# espécie, sexo e por ilhas
janitor::tabyl(penguins, species, sex, island)

## exercicio 10 ----
# Usando a tabela do exercicio 8 e pacote janitor, e as funções adorn_totals(), 
#adicione os totais de linhas e colunas
penguins_freq <- janitor::tabyl(penguins, species, sex)
penguins_freq

janitor::adorn_totals(penguins_freq, where = c("row", "col"))

# apply -------------------------------------------------------------------

## antes de seguir, crie um objeto penguins_na retirando as linhas com NA
penguins_na <- na.omit(penguins)
penguins_na

## exercicio 11 ----
# Calcule a média de cada coluna numérica
apply(penguins_na[, c(3:6)], 2, mean)

## exercicio 12 ----
# Calcule o desvio padrão de cada coluna numérica
apply(penguins_na[, c(3:6)], 2, sd)

## exercicio 13 ----
# Encontre o valor mínimo e máximo de cada coluna numérica
apply(penguins_na[, c(3:6)], 2, max)
apply(penguins_na[, c(3:6)], 2, min)

## exercicio 14 ----
# Calcule a média da massa corporal para cada espécie de pinguim
tapply(penguins_na$body_mass_g, penguins_na$species, mean)

## exercicio 15 ----
# Use a funcao 'summary' para fazer a descricao da massa corporal para cada 
# espécie de pinguim
tapply(penguins_na$body_mass_g, penguins_na$species, summary)

# programacao -------------------------------------------------------------

## exercicio 16 ----
# Escreva um loop for que percorra cada linha do penguins_na e classifique os
# pinguins como tendo "bico_longo" ou "bico_curto", com base em um comprimento 
# de bico maior que 40 mm e add num coluna chamada 'bill_length_class'

penguins_na$bill_length_class <- ""
penguins_na

for(i in 1:nrow(penguins_na)){
    
    if(penguins_na[i, ]$bill_length_mm > 40) {
        
        penguins_na[i, ]$bill_length_class <- "bico_longo"
        
    }else {
        
        penguins_na[i, ]$bill_length_class <- "bico_curto"
    }
}

penguins_na[, c("bill_length_mm", "bill_length_class")]

## exercicio 17 ----
# Use um loop while para emagrecer um pinguim. Comece com um pinguim pesando 10 kg 
# e retire 100 g a cada iteração do loop ate 3.5 kg. Conte quantas retiradas aconteceram

massa_pinguim <- 10000
i <- 0

while(massa_pinguim > 3500){
    massa_pinguim <- massa_pinguim - 100
    i <- i + 1
}

massa_pinguim
i

## exercicio 18 ----
# Escreva uma função que verifique se o comprimento do bico (bill_length_mm) de 
# um pinguim é maior que 40 mm

check_bill <- function(bill_length){
    
    if(bill_length > 40){
        return("Bico grande")
        
    }else {
        return("Bico pequeno")
    }
}

check_bill(penguins_na$bill_length_mm[1])

## exercicio 19 ----
# Como fazer a funcao anterior ser aplicada a todos a toda a coluna ]
# 'bill_length_mm'? Sim, tem um apply aqui....
sapply(penguins_na$bill_length_mm, check_bill)

## exercicio 20 ----
# exporte 100 arquivos de 100 linhas usando amostragens aleatorias das linhas do 
# penguins_na. os nomes podem ser "penguins_na1", "penguins_na2", ..., "penguins_na100"
# dica: exporte numa pasta chamada 'arquivos', amostragem (sample), 
# exportar (write.csv), e nomes dos arquivos (paste0)

for(i in 1:100){
    
    penguins_na_i <- penguins_na[sample(1:100, 100), ]
    write.csv(penguins_na_i, 
              paste0("02_exercises/arquivos/penguins_na", i, ".csv"), 
              row.names = FALSE)
    
}

## exercicio 20 ----
# importe os 100 arquivos combinando-os em um mesmo objeto
# dica: listar arquivos (dir), combinar (rbind)

# listar arquivos
files <- dir(path = "02_exercises/arquivos", full.names = TRUE)
files

# importar
penguins_import <- NULL

for(i in files){
    
    penguins_import_i <- read.csv(i)
    penguins_import <- rbind(penguins_import, penguins_import_i)
}

penguins_import


# desafio -----------------------------------------------------------------

# fazer um loop para automatizar o download de varios arquivos.
# link exemplo: https://github.com/mauriciovancine/workshop-r-programming/blob/main/dados/penguins_na1.csv
# funcoes: download.file, paste0, basename
# atencao: em download.file precisa do argumento mode = "wb"

dir.create("02_exercises/download")

for(i in 1:100){
    
    url_i <- paste0("https://github.com/mauriciovancine/workshop-r-programming/blob/main/dados/penguins_na", i, ".csv")
    name_i <- basename(url_i)
    
    download.file(url = url_i, destfile = paste0("dowload/", name_i), mode = "wb")
    
}

# end ---------------------------------------------------------------------