Colorado <- function(filelocation){
  readcols <- c("character", "character", "character", "character", "character", "NULL", "character", "NULL", "NULL", "NULL", "NULL", "character", "NULL", "NULL", "character", "character", "NULL", "NULL", "character", "character", "character", "character", "character", rep("NULL",9), "character", "character", "character", "character", rep("NULL", 115))

  for (file in file_list){

    # if the merged dataset doesn't exist, create it
    if (!exists("Colorado")){
      Colorado <- read.csv(file, header=TRUE, nrows = 100, colClasses = readcols)

    }

    # if the merged dataset does exist, append to it
    if (exists("Colorado")){
      temp_dataset <-read.csv(file, header=TRUE, nrows = 100, colClasses = readcols)

      dataset<-rbind(Colorado, temp_dataset)
      rm(temp_dataset)
    }

  }
  return(Colorado)
}
