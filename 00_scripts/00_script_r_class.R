#' ---
#' title: manipulacao de dados e programacao em R
#' author: mauricio vancine
#' date: 2025-10-29
#' ---

# prepare r -------------------------------------------------------------

# packages


# packages ----------------------------------------------------------------

# install packages
# install.packages(palmerpenguins)

# load packages
library(palmerpenguins)

# topics ------------------------------------------------------------------

# 1. revisao
# 2. explorar dados
# 3. programacao

# 1. revisao --------------------------------------------------------------

## revisao ----

# 1. Console
# 2. Script
# 3. Operadores
# 4. Objetos
# 5. Funções
# 6. Pacotes (*packages*)
# 7. Ajuda (*help*)
# 8. Ambiente (*environment*)
# 9. Diretório
# 10. Citações

## pseudocodigo ----

# pseudocodigo
# 0. listar pacotes
# 1. importar dados
# 2. limpar e ajustar dados
# 3. analises estatisticas
# 4. graficos
# 5. exportar resultados

# codigo

# 0. listar pacotes
library(tidyverse)
library(palmerpenguins)

# 1. importar dados
penguins <- penguins_raw
penguins

# 2. limpar e ajustar dados
penguins_clean <- na.omit(penguins)
penguins_clean

# 3. analises estatisticas
cor.test(penguins_clean$bill_length_mm, penguins_clean$bill_depth_mm)

# 4. graficos
plot(penguins_clean$bill_length_mm, penguins_clean$bill_depth_mm, pch = 20)

# 5. exportar resultados
png("grafico_penguins.png")
plot(penguins_clean$bill_length_mm, penguins_clean$bill_depth_mm, pch = 20)
dev.off()

# 2 explorar dados --------------------------------------------------------

## dados ----
# instalar 
# install.packages("palmerpenguins")

# carregar
library(palmerpenguins)

# ajuda dos dados
?penguins
?penguins_raw

# remover nas
penguins_sem_na <- na.omit(penguins)
penguins_sem_na

# explorar dados
head(penguins_sem_na, n = 10)

## table ----
# vetor categorico
cores <- c("vermelho", "azul", "verde", "vermelho", "azul", "vermelho")

# tabela de frequências
table(cores)

# frequencia absoluta
table(penguins_sem_na$species)

# frequencia relativa
prop.table(table(penguins_sem_na$species))
prop.table(table(penguins_sem_na$species)) * 100
round(prop.table(table(penguins_sem_na$species)), 4) * 100

# funcao composta
1:3
sum(1:3)
log(sum(1:3))

# frequencia absoluta duas colunas
table(penguins_sem_na$species, penguins_sem_na$island)

# frequencia relativa
round(prop.table(table(penguins_sem_na$species, penguins_sem_na$island)), 4) * 100

## apply ----
# matriz
m <- matrix(1:9, nrow = 3, byrow = TRUE)
m 

# funcao mean nas linhas (MARGIN = 1)
m_mean_row <- apply(m, 1, mean)
m_mean_row

m <- matrix(c(1, 3, 5, 2, 4, 6), ncol = 3, byrow = TRUE)
m

apply(m, 1, sum)
apply(m, 1, mean)
apply(m, 1, sd)

apply(m, 2, sd)



# familia apply
# apply(X, MARGIN, FUN, ...)
# lapply(X, FUN, ...)
# sapply(X, FUN, ...)
# vapply(X, FUN, FUN.VALUE, ...)
# tapply(X, INDEX, FUN, ...)
# mapply(FUN, ..., MoreArgs = NULL)
# rapply(object, f, classes = "ANY", how = "replace")

# lapply
# lista
x <- list(a = 1:5, b = 6:10)
x

lapply(x, mean)  # media de cada lista - retorna lista

# sapply
# lista
x <- list(a = 1:5, b = 6:10)
x

sapply(x, mean)  # media de cada lista - retorna o que quiser...

# vapply
# lista
x <- list(a = 1:5, b = 6:10)
x

vapply(x, mean, numeric(1))  # media de cada lista - retorna escolha

# tapply
# data frame
df <- data.frame(x = c(rep(1, 3), rep(2, 3)), 
                 f = factor(rep(1:2, each = 3)))
df

tapply(df$x, df$f, sum)  # soma por grupo

# mapply
# dois vetores
x <- c(1, 2, 3)
y <- c(4, 5, 6)

mapply(sum, x, y) # soma de cada elemento
mapply(paste0, x, y) # combinacao de cada elemento

# rapply
# lista
l <- list(a = 4, b = "texto", c = list(d = 25, e = 36))
l

# aplica sqrt() apenas aos elementos numericos
rapply(l, sqrt, classes = "numeric", how = "replace")

# aplica sqrt() e retornando um vetor achatado
rapply(l, sqrt, classes = "numeric", how = "unlist")

# usando deflt para retornar NA para elementos nao numericos
rapply(l, sqrt, classes = "numeric", deflt = NA)

# medidas resumo
# media por linhas
apply(penguins_sem_na[1:20, 3:6], 1, mean)

# media por colunas
apply(penguins_sem_na[1:20, 3:6], 2, mean)

# desvio padrao por linhas
apply(penguins_sem_na[1:20, 3:6], 1, sd)

# desvio padrao por colunas
apply(penguins_sem_na[1:20, 3:6], 2, sd)

# media por especie
tapply(penguins_sem_na$bill_length_mm, penguins_sem_na$species, mean)

# media por ilha
tapply(penguins_sem_na$bill_length_mm, penguins_sem_na$island, mean)

# desvio padrao por especie
tapply(penguins_sem_na$bill_length_mm, penguins_sem_na$species, sd)

# desvio padrao por ilha
tapply(penguins_sem_na$bill_length_mm, penguins_sem_na$island, sd)

# 3. programacao ----------------------------------------------------------

## controle de fluxo ----

### if ----
# valor
x <- 4

# condicao
x > 5

# teste
if(x > 5){
    print("x é maior que 5")
}
    
# valores
x <- 10
y <- 10

# condicao
x > 5 & y > 8

if(x > 5 & y > 8){
    print("x e y são maiores que 5")
}

# valores
x <- 10
y <- 2

# condicao
x > 5 | y > 8

# teste
if(x > 5 | y > 8){
    print("x ou y é maior que 5")
}

### if e else ----
# valor
x <- 3

# condicao
x > 5

# teste
if(x > 5){
    print("x é maior que 5")
} else{
    print("x é menor ou igual a 5")
}

### else if ----
x <- 7
if(x > 10){
    print("x é maior que 10")
} else if(x > 5){
    print("x está entre 6 e 10")
    hist(1)
    mean(1:5)
} else{
    print("x é 5 ou menor")
}

## estruturas de repeticao ----

### for ----
for(i in 1:10){
    print(i)
}

prog <- c("R", "python", "julia", "Fortran")
for(i in prog){
    print(i)
}

### while ----
x <- 1
while(x <= 5){
    print(x)
    x <- x + 1  # atualiza o x
}

### repeat ----
x <- 1
repeat{
    print(x)
    x <- x + 1
    if(x > 5){
        break  # para o loop para x > 5
    }
}

### break ----
for(i in 1:10){
    if(i == 6){
        break  # sai do laco quando i for igual a 6
    }
    print(i)
}

### next ----
for(i in 1:5){
    if(i == 3){
        next  # pula o numero 3
    }
    print(i)
}

### controle de fluxo e repeticao ----

# for e if/else
for(i in 1:10){
    
    if(i %% 2 == 0){
        print(paste(i, "é par"))
    } else{
        print(paste(i, "é ímpar"))
    }
}

# while e if/else
x <- 1
while(x <= 10){
    
    if(x %% 2 == 0){
        print(paste(x, "é par"))
    } else{
        print(paste(x, "é ímpar"))
    }
    x <- x + 1
}

### usos avancados do for ----

#### elementos de uma lista
prog <- c("R", "python", "julia", "Fortran")

for(i in prog){
    print(i)
    
}

#### posicao de uma lista
prog <- c("R", "python", "julia", "Fortran")

for(i in 1:length(prog)){
    
    print(i)
    print(prog[i])
    
}

#### combinando resultados em um objeto vazio
x <- c(1, 4, 9, 16)

obj <- NULL

for(i in x){
    
    raiz <- sqrt(i)
    obj <- c(obj, raiz)
}
obj

#### combinando resultados em um objeto vazio pela posicao
x <- c(1, 10, 100, 1000)

obj <- NULL

for(i in 1:length(x)){
    
    obj[i] <- log10(x[i])
}
obj

#### combinando resultados em um objeto vazio por linhas
df <- data.frame()

for(i in 1:5){
    
    q <- i^2
    c <- i^3
    res <- data.frame(numero = i, quadrado = q, cubo = c)
    df <- rbind(df, res)
}
df

#### combinando resultados em um objeto vazio por colunas
df <- data.frame(numero = 1:5)

for(i in 1:5){
    
    res <- i * 1:5
    df_res <- data.frame(res)
    colnames(df_res) <- paste0("mult", i)
    df <- cbind(df, df_res)
}
df

## funcoes ----

### estrutura
# nome_da_funcao <- function(argumentos){
    # corpo da funcao
    # calculos, operacoes ou processos
    #return(resultado)
# }

### definicao
quadrado <- function(x){
    return(x^2)
}

# uso
quadrado(2)

raiz <- function(x){
    return(x^(1/2))
}

# uso
raiz(4)

### multiplos argumento
# definicao
soma <- function(a, b){
    return(a + b)
}

# uso
soma(40, 2)

### argumento padrao
# definicao
saudacao <- function(nome = "Amigo"){
    return(paste("Olá,", nome))
}

# uso
saudacao()

### funcoes e controle de fluxo
# definicao
par_ou_impar <- function(num){
    if(num %% 2 == 0){
        return("Par")
    } else{
        return("Ímpar")
    }
}

# uso
par_ou_impar(42)

### funcao e repeticao
# definicao
soma_sequencia <- function(n){
    total <- 0
    for(i in 1:n){
        total <- total + i
    }
    return(total)
}

# uso
soma_sequencia(3)

### ...
# definicao
soma_variavel <- function(...){
    return(sum(...))
}

# uso
soma_variavel(1, 2, 3, 4)

### funcoes externas
# arquivo: funcoes_util.R
soma <- function(a, b) {
    return(a + b)
}

multiplicacao <- function(a, b) {
    return(a * b)
}

# carrega as funcoes
source("00_scripts/funcoes_util.R")

# uso
res_soma <- soma(3, 5)
res_soma

res_multi <- multiplicacao(3, 5)
res_multi

# end ---------------------------------------------------------------------