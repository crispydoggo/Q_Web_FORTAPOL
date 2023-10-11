
# FUNDACIÓN IDEA
# INL008 - FORTAPOL
# Equipo A
# Q-Method Data Cleaning

rm( list = ls())

# =================================
# Libraries
# =================================

library(tidyverse) # Manipulate data and stuff
library(qmethod) # To perform the q-method analysis
library(readxl) # Read excel files
library(XLConnect) # Export data to existing excel file


# =================================
# Connect Real Time Data Base Q-Sort
# =================================

# For security, the API Key and the other data needed to access the data is set 
# in the project's environment throught the .Renviron file.
# If you want to access the Data Base please email us at: lrojasso@fundacionidea.org.mx

# The package doesn't work, you need to download manually the json files from the firbase 

# =================================
# Good ol' Json files and Data Wrangling Function
# =================================

# Import manually the data 

  # E1. Prioritize skills for criminal investigation
  jsons_e1 <- rjson::fromJSON(
    file = "./Data/ejercicio-1-edd6d-default-rtdb-export.json"
  )
  
  # Remove responses with no data
  jsons_e1[c(2,3,5)]= NULL

  # E2. Biases of criminal investigators
  jsons_e2 <- rjson::fromJSON(
    file = "./Data/fortapol-taller-default-rtdb-export.json"
  )

  # Import the data wrangling function
  
  source("ken_data.R")



# =======================================
# Export to Excel Ken Q Analysis
# =======================================

  # Define the path where to edit and save the Excel documents
  name_e1 <- "./Excel_files/E1_Q.xlsx"
  name_e2 <- "./Excel_files/E2_Q.xlsx"

  # Function to export dataframe
  
  export_xls <- function(data, name){
    # Exports Clean Dataframe to excel without headers
    # ----------------------------------
    
    book <- loadWorkbook(name)
    writeWorksheet(book, data, sheet = 2, header = FALSE)
    saveWorkbook(book, file = name)
  }

  # Export data frames to existing excel documents
  export_xls(qsort_e1, name_e1)
  export_xls(qsort_e2, name_e2)


# =========================================
# Export to CSV Ken Q Analysis
# =========================================

qsort_e1 <- ken_data(jsons_e1)
qsort_e2 <- ken_data(jsons_e2)


# Old code, we need to bring excel files :/

# Export CSVs
write.csv(qsort_e1, "q_sort_e1_v2.csv", row.names=FALSE)
write.csv(qsort_e2, "q_sort_e3.csv", row.names=FALSE)

# Remember to delete the last line of the CSV


# =================================
# Q-Analysis
# =================================


# results <- qmethod(q_sort, nfactors = 3)

# See the factor loadings
# round(results$loa, digits = 2)

# See the flagged Q-sorts: those indicating 'TRUE'
# results$flag

