jogar_dados <- function(jogadas, lados){
    
    dice_resul <- sample(lados, jogadas, replace = TRUE)
    
    return(dice_resul)
        
}

