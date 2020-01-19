data = read.csv(file = "C:\\Users\\liumi\\Econ-survey\\Econ101Survey2.csv", header = TRUE)

majors1 = c()
majors2 = c()


for (i in 1:dim(data)[1]) {
  if (data$Q9[i] == "I expect a double major with economics being one of my majors" || 
      data$Q9[i] == "I expect a single major in economics") {
    begin = 30
    end = 61
    characters = 140
  }
  else if (data$Q9[i] == "No, I do not expect to major in economics") {
    begin = 62
    end = 93
    characters = 123
  }
  else {
    begin = 1
    end = 1
    characters = 1
  }
    
  majors_found = 0
  
  for (j in begin:end) {
    if (data[i,j] == "Pick one or two majors") {
      
      str = as.character(data[1,j])
      
      if (majors_found == 0) {
        majors1 = c(majors1, substr(str, characters, nchar(str)))
        majors_found = majors_found + 1
      }
      
      else if (majors_found == 1) {
        majors2 = c(majors2, substr(str, characters, nchar(str)))
        majors_found = majors_found + 1
      }
    }
  }
  
  if (majors_found == 0) {
    majors1 = c(majors1, "")
    majors2 = c(majors2, "")
  }
  else if (majors_found == 1) {
    majors2 = c(majors2, "")
  }
}

cleaned = cbind(data[,1:29], majors1, majors2, data[,94:dim(data)[2]])
write.csv(cleaned, file = "C:\\Users\\liumi\\Econ-survey\\majors_cleaned_survey2.csv")
