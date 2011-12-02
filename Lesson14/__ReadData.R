###############################################################################
# Title: PSYC 7765 - Lesson 14 - Read Data
# Description: This file should be sourced from other files, setting the
#              appropriate working directory to look for the directory given
#              in variable `sourceDirectory`
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Dec  2 12:08:10 2011 - Organized all of my files - JRS
###############################################################################

require(plyr)
require(car)

###############################################################################
# Read in raw data
###############################################################################

sourceDirectory <- 'Data/Raw/'

allSubjects <- (myFolder<-dir(sourceDirectory))[grep('subject[0-9]+\\.csv', myFolder)] 

combineDatasets <- function(fileName){
     path <- paste(sourceDirectory, fileName, sep="")
     dataset <- read.csv(path, stringsAsFactors=F)          
     subject <- gsub('subject([0-9]+)\\.csv', '\\1', fileName)  
     dataset$subject <- as.numeric(subject)                     
     return(dataset)                                           
}
dat_raw <- ldply(allSubjects, combineDatasets)

###############################################################################
# Data Cleaning
###############################################################################

# Codings
# sex: [fF]emale, [mM]ale, [mM], [fF]

dat_clean <- within(dat_raw,{                                   
     isMale <- grepl('^[mM].*$', sex)  
     isFemale <- grepl('^[fF].*$', sex)                        
     
     sexFactor <- as.factor(ifelse(isMale, 'male', 'female'))   
     sexFactor <- relevel(sexFactor, ref="female")
})

###############################################################################
# Read in raw covariates
###############################################################################

dat_cov_raw <- read.csv(paste('Data', 'SubjectInfo.csv', sep="/"), stringsAsFactors=F)

###############################################################################
# Covariates Cleaning
###############################################################################

# Codings
# raceeth: 
#   1='White';2='Black';3='HispLat';4='Asian';5='PacIsl';6='Other'

dat_cov_clean <- within(dat_cov_raw,{                                   
     raceRecoded <- recode(raceeth, 
          # FILL IN
     )
     raceRecodedF <- factor(raceRecoded, 
          levels=c('White', 'Black', 'HispLat', 'Asian', 'PacIsle', 'Other')
     )
     raceRecodedF <- relevel(raceRecodedF, ref="White")
})

###############################################################################
# Main Dataset
###############################################################################

dat_wide_w_covs <- merge(dat_clean, dat_cov_clean, by.x="subject", by.y="subject")

###############################################################################
# Tests: if all of these tests don't pass, delete data, so no other files can
#        use it.
###############################################################################

if(!with(dat_wide_w_covs, all(
     all(xor(isMale, isFemale)), # Have to be either Male or Female
     nlevels(raceRecodedF) == 6 # Might not reflect all races in dataset
))){
     rm(dat_wide_w_covs)
}

###############################################################################
# Environment Cleaning: remove other sizable variables that you might not use
###############################################################################

rm(dat_raw, dat_clean, dat_cov_raw, dat_cov_clean)