computeFrequencyList <- function(text.input) {
  punct <- '[]\\?!\"\'#$%&(){}+*/:;,._`|~\\[<=>@\\^-]'
  punct2 <- sub( "'", "", punct )
  text.clean <- gsub( punct2, "", text.input )
  text.clean <- gsub( '\n', " ", text.clean )
  text.clean<-tolower(text.clean)
  words.vector <- unlist(strsplit(text.clean, "\\s+"))
  freq.list <- table(words.vector)
  freq.list
}

detectPhishing <- function(freq.list){
  if (!is.na(freq.list["password"])) {
    result <- "Warning! This looks like a phishing email!"
  }
  else {
    result <- "This looks like a normal email."
  }
  result
} 