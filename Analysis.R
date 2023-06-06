
# FUNDACIÓN IDEA
# INL008 - FORTAPOL
# Equipo A
# Q-Method Analysis

rm( list = ls())

# =================================
# Libraries
# =================================
library("benchmarkme") # efficient R set up
library(fireData) # Connect Real Time data base
library(tidyverse) # Manipulate data and stuff
library(qmethod) # To perform the q-method analysis

# =================================
# Connect Real Time Data Base Q-Sort
# =================================

# For security, the API Key and the other data needed to access the data is set 
# in the project's environment throught the .Renviron file.
# If you want to access the Data Base please email us at: lrojasso@fundacionidea.org.mx

# The package doesn't work lol, I might do it in quarto to use both R and python

# =================================
# Good ol' Json files
# =================================

# Import manually the data 

  # E1. Prioritize skills for criminal investigation
  jsons_e1 <- rjson::fromJSON(
    file = "./Data/e1.json"
  )
  
  # E2. Biases of criminal investigators
  jsons_e2 <- rjson::fromJSON(
    file = "./Data/e2.json"
  )

  jsons <- rjson::fromJSON(
    file = "./Data/e2.json"
  )
  
# Initialize the loop with our first observation
data <- as.data.frame( jsons[[1]] )

# Append the rest of the observations to a dataframe
for( i in 2:length(jsons)){
  
  data <- rbind(data, as.data.frame(jsons[[i]]))
  
}

# =================================
# Ripping appart sort values
# =================================

# Extract the only the sorts column
sorts <- data$sort

# Initialize the number of q-statements
aux <- as.numeric(unlist(str_split(sorts[[1]], pattern = "\\|")))

# Initialize the matrix with data
matrix <- matrix(
  nrow = length(aux), # Number of q statements
  ncol = length(sorts)  # Number of participants
)

# Asign the values to the matrix
matrix[,1] <- aux

# Begin the loop to store values
for( i in 2:length(sorts)){
  
  aux <-  as.numeric(unlist(str_split(sorts[[i]], pattern = "\\|")))
  matrix[,i] <- aux
  
}

# Rename the columns to make it a dataframe
colnames(matrix) <- paste("p", 1:ncol(matrix))

# store the values as data frame
q_sort <- as.data.frame(matrix)


# =========================================
# Ripping appart sort values Ken-Q Analysis
# =========================================

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


# =========================================
# Export to CSV Ken Q Analysis
# =========================================

qsort_e2 <- ken_data(jsons_e2)

write.csv(qsort_e2, "q_sort_e2.csv", row.names=FALSE)

# =================================
# Q-Analysis
# =================================

results <- qmethod(q_sort, nfactors = 3)

# See the factor loadings
round(results$loa, digits = 2)

# See the flagged Q-sorts: those indicating 'TRUE'
results$flag

