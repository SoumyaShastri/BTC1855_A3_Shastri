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

# Create function to give user a visual clue of their progress
visualClue <- function(word, guesses) {
  masked_word <- "" #Initialize empty string
  for (letter in strsplit(word, "")[[1]]) { #takes each letter in the 'word' and splits into individual characters
    if (tolower(letter) %in% guesses) { #tolower function allows user to enter and the program to accept both upper and lower case letters
      masked_word <- paste(masked_word, letter, sep = " ") #if letter found in 'guesses' then letter is revealed
    } else {
      masked_word <- paste(masked_word, "_", sep = " ") #else letter remains hidden with "_"
    }
  }
  cat(masked_word, "\n") #this prints the final word representation
}


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
#* inform user of incorrect or correct tries - graphical representation?? 
