quadrado <- function(i){
    return(i^2)
}

for(i in 1:5){
    print(quadrado(i))
}


jogar_dados <- function(jogadas, tamanho){
    
    ret <- NULL
    for(i in 1:jogadas){
        ret <- c(ret, sample(1:tamanho, 1))
    }
        
    return(ret)
        
}

jogar_dados(jogadas = 10, tamanho = 12)



