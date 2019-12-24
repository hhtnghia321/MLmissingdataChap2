library(tidyverse)

setwd(paste0(getwd(),"/data"))
Data <- read.table("labor-neg.data",sep = ",")
names <- c("dur","wage1.wage", "wage2.wage","wage3.wage","cola","hours.hrs", "pension","stby_pay","shift_diff",
           "educ_allw.boolean","holidays","vacation","lngtrm_disabil.boolean","dntl_ins","bereavement.boolean","empl_hplan","Classes")
colnames(Data) <- names
Data <- as_tibble(Data)


#convert numeric data
for (i in c(1:4,6,8,9,11)) {
  Data[[i]] <- as.numeric(as.character(Data[[i]]))
}

#filling NA value
for(i in c(5,7,10,12,13,14,15,16)) {
  Data[[i]][Data[[i]]== "?"] <- NA
}

#inspect NA 
apply(Data,2,function(a)table(a,useNA = "always"))
