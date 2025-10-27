# ----
# title: topicos avancados em programacao em R
# author: mauricio vancine
# date: 2025-10-29
# ----

# table -------------------------------------------------------------------

## carregue os dados do palmerpenguins

## exercicio 01 ----
# Qual é a frequencia absolulta e relativa de cada espécie?

## exercicio 02 ----
# Qual é a frequencia absolulta e relativa de pinguins machos e fêmeas?

## exercicio 03 ----
# Quantos pinguins Adelie são machos? E quantas fêmeas da espécie Gentoo?

## exercicio 04 ----
# Qual ilha tem a maior quantidade de pinguins?

## exercicio 05 ----
# Em qual ilha a espécie Gentoo é mais abundante?
# E onde Adelie tem a maior concentração?

## exercicio 06 ----
# Em qual ilha há o maior número de pinguins machos?

## exercicio 07 ----
# Quantos pinguins fêmeas da espécie Chinstrap estão presentes na ilha Dream?

## exercicio 08 ----
# Usando o pacote janitor e a função tabyl, crie uma tabela de frequência de 
# espécie e sexo 

## exercicio 09 ----
# Usando o pacote janitor e a função tabyl, crie uma tabela de frequência de 
# espécie, sexo e por ilhas

## exercicio 10 ----
# Usando a tabela do exercicio 8 e pacote janitor, e as funções adorn_totals(), 
#adicione os totais de linhas e colunas

# apply -------------------------------------------------------------------

## antes de seguir, crie um objeto penguins_na retirando as linhas com NA

## exercicio 11 ----
# Calcule a média de cada coluna numérica

## exercicio 12 ----
# Calcule o desvio padrão de cada coluna numérica

## exercicio 13 ----
# Encontre o valor mínimo e máximo de cada coluna numérica

## exercicio 14 ----
# Calcule a média da massa corporal para cada espécie de pinguim (dica: tapply)

## exercicio 15 ----
# Use a funcao 'summary' para fazer a descricao da massa corporal para cada 
# espécie de pinguim (dica: tapply)

# programacao -------------------------------------------------------------

## exercicio 16 ----
# Escreva um loop for que percorra cada linha do penguins_na e classifique os
# pinguins como tendo "bico_longo" ou "bico_curto", com base em um comprimento 
# de bico maior que 40 mm e add num coluna chamada 'bill_length_class'

## exercicio 17 ----
# Use um loop while para emagrecer um pinguim. Comece com um pinguim pesando 10 kg 
# e retire 100 g a cada iteração do loop ate 3.5 kg. Conte quantas retiradas aconteceram


## exercicio 18 ----
# Escreva uma função que verifique se o comprimento do bico (bill_length_mm) de 
# um pinguim é maior que 40 mm

## exercicio 19 ----
# Como fazer a funcao anterior ser aplicada a todos a toda a coluna
# 'bill_length_mm'? dica: sapply


## exercicio 20 ----
# exporte 100 arquivos de 100 linhas usando amostragens aleatorias das linhas do 
# penguins_na. os nomes podem ser "penguins_na1", "penguins_na2", ..., "penguins_na100"
# dica: exporte numa pasta chamada 'arquivos', amostragem (sample), 
# exportar (write.csv), e nomes dos arquivos (paste0)


## exercicio 21 ----
# importe os 100 arquivos combinando-os em um mesmo objeto
# dica: listar arquivos (dir), combinar (rbind)


# desafio -----------------------------------------------------------------

# fazer um loop para automatizar o download de varios arquivos.
# link exemplo: https://github.com/mauriciovancine/workshop-r-programming/blob/main/dados/penguins_na1.csv
# funcoes: download.file, paste0, basename
# atencao: em download.file precisa do argumento mode = "wb"


# end ---------------------------------------------------------------------