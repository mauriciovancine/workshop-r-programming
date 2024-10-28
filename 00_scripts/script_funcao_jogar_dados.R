jogar_dados <- function(jogadas, lados){
    
    ret <- NULL
    for(i in 1:jogadas){
        ret <- c(ret, sample(1:lados, 1))
    }
        
    return(ret)
        
}

