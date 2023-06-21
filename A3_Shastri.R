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

# Create function to check if the user's guess is correct
isCorrectGuess <- function(word, guess) {
  guess <- tolower(guess)  # Convert guess to lowercase 
  guess %in% strsplit(tolower(word), "")[[1]]  # Check if guess exists in list of characters from strsplit which will render %in% true
}

#Create function to play the game
playHangman <- function(word) 
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

  # Create a game loop so the game is interactive
  while (TRUE) {
    visualClue(word, guesses)
    cat("\n")
    
    # Get user input
    user_input <- tolower(readline(prompt = "Enter your guess (one letter or the whole word): "))
    
    # Give the option to user if they want to guess the whole word
    # The program assumes that if user inputs more than one letter, they are attempting to guess the whole word
    if (nchar(user_input) > 1) {
      if (tolower(user_input) == tolower(word)) {
        cat("Congratulations! You guessed the capital correctly. Game won!\n")
      } else {
        # Once the word is guessed incorrectly, there are no more tries remaining, the secret word is revealed
        cat("Incorrect guess! The secret word was:", word, "\n")
      }
      break
    }
    # Ensures the user input is a letter
    if (!grepl("[a-z]", user_input) || nchar(user_input) != 1) {
      cat("Invalid entry. Please enter a single letter or the whole word. You got this!\n")
      next
    }
    
    
    

##This program's capabilities: 
#* inform of remaining tries
#* ensure character entered is letter 
#* inform user of incorrect or correct tries - graphical representation?? 
