#BTC1855H - Assignment 3: Hangman Game 
#Soumya Shastri

#*Create a a dictionary of words for the program to recognize in a txt. file
file_path <- "word_inventory.txt"
#*the read.table function used to read the file, we indicate that there is no header
#* the newline character "\n" allows each line to be treated as a separate record
#* colClasses = "character" argument ensures the content is read as character strings
wordList <- read.table(file_path, header=FALSE, sep = "\n", colClasses = "character")

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
