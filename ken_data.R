

ken_data <- function(jsons){
  
  # Initialize the loop with our first observation
  data <- as.data.frame( jsons[[1]] )
  
  # Append the rest of the observations to a dataframe
  for( i in 2:length(jsons)){
    data <- rbind(data, as.data.frame(jsons[[i]]))
  }
  
  # Extract the only the sorts column
  sorts <- data$sort
  
  # Initialize the number of q-statements
  aux <- as.numeric(unlist(str_split(sorts[[1]], pattern = "\\|")))
  
  # Initialize the matrix with data
  matrix <- matrix(
    nrow = length(sorts),  # Number of participants
    ncol = length(aux), # Number of q statements
  )
  
  
  # Asign the values to the matrix
  matrix[1,] <- aux
  
  # Begin the loop to store values
  for( i in 2:length(sorts)){
    
    aux <-  as.numeric(unlist(str_split(sorts[[i]], pattern = "\\|")))
    matrix[i,] <- aux
    
  }
  
  # Rename the columns to make it a dataframe
  colnames(matrix) <- str_remove( paste("s", 1:ncol(matrix)), " ")
  
  # Store the values as data frame and add a column with participants ID
  q_sort <- tibble( participants = str_remove(paste("P", 1:nrow(matrix)), " "),  as.data.frame(matrix))
  
  return(q_sort)
  
}