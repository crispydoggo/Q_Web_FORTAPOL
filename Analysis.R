
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
# Good ol' Json files and Data Wrangling Function
# =================================

# Import manually the data 

  # E1. Prioritize skills for criminal investigation
  jsons_e1 <- rjson::fromJSON(
    file = "./Data/habilidades-ppi-default-rtdb-export.json"
  )
  
  # E2. Biases of criminal investigators
  jsons_e2 <- rjson::fromJSON(
    file = "./Data/fortapol-taller-default-rtdb-export.json"
  )

# Import the data wrangling function
  
  source("ken_data.R")

# =========================================
# Export to CSV Ken Q Analysis
# =========================================

qsort_e1 <- ken_data(jsons_e1)
qsort_e2 <- ken_data(jsons_e2)

# Export CSVs
write.csv(qsort_e1, "q_sort_e1.csv", row.names=FALSE)
write.csv(qsort_e2, "q_sort_e2.csv", row.names=FALSE)

# Remember to delete the last line of the CSV

# =================================
# Q-Analysis
# =================================

# Initialize the loop with our first observation
data <- as.data.frame( jsons_e1[[1]] )

# Append the rest of the observations to a dataframe
for( i in 2:length(jsons_e2)){
  
  data <- rbind(data, as.data.frame(jsons_e1[[i]]))
  
}

results <- qmethod(q_sort, nfactors = 3)

# See the factor loadings
round(results$loa, digits = 2)

# See the flagged Q-sorts: those indicating 'TRUE'
results$flag

