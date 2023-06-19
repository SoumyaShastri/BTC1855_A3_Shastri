#Hangman by Soumya Shastri

#Create a a dictionary of words for the program to recognize
wordList <- c("washington", "cairo", "ottawa", "vienna", "paris", "berlin", "canberra")
#Convert the word list to a text file 
file_path <- "word_list.txt"
writeLines(wordList, file_path)
#In order to read the word list from the program
read_wordList <- readLines(file_path)
# One word will be sampled from the list as the secret word 
secretWord <- sample(wordList, size = 1)
#Max number of incorrect guesses allowed
max_incorrect_guesses <- 10
#Tracking correct and incorrect guesses 
guesses <- c()
incorrect_guesses <- c() 


#Welcome messaged to user: inform them of the length of the secret word and how many guesses they are allowed
cat("Welcome to Hangman!\n")
cat("Your category is National Capitals.\n")
cat("This secret word has", nchar(secretWord), "letters.\n")
cat("Type a letter to make your first guess.\n")
cat("You have a total of", max_incorrect_guesses, "guesses available.\n")
cat("Good luck!")



##TO DO: 
#* inform of remaining tries
#* ensure character entered is letter 
#* Both capital and lowercase letters are accepted 
#* inform user of incorrect or correct tries - graphical representation?? 