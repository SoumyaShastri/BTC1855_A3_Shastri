#Hangman by Soumya Shastri

#To create a a dictionary of words for the program to recognize
wordList <- c("washington", "cairo", "ottawa", "vienna", "paris", "berlin", "canberra")
#Convert the word list to a text file 
file_path <- "word_list.txt"
writeLines(wordList, file_path)
#In order to read the word list from the program
read_wordList <- readLines(file_path)
