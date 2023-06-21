#BTC1855H - Assignment 3: Hangman Game 
#Soumya Shastri

##Program Capabilities: 
#* - 




#Create a a dictionary of words for the program to recognize
wordList <- c("ankara", "amsterdam", "athens", "baghdad", "baku", "beijing", "berlin", "bogota", 
              "brasilia", "brussels", "budapest", "cairo", "canberra", "caracas", "copenhagen", 
              "dhaka", "dublin", "havana", "islamabad", "jakarta", "kabul", "kathmandu", "london",
              "luxembourg", "monaco", "montevideo", "muscat", "oslo", "ottawa", "paris", "prague", 
              "rome", "seoul", "stockholm", "tokyo", "vienna", "washington", "wellington")
#Convert the word list to a text file 
file_path <- "word_list.txt"
writeLines(wordList, file_path)
#the readLines function is used to read the file
read_wordList <- readLines(file_path)

# One word sampled from the list as the secret word 
secretWord <- sample(wordList, size = 1)

# Create function to give user a visual clue of their progress
displayProgress <- function(word, guesses) {
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

# Create function to play the game
playHangman <- function(word) {
  # Max number of incorrect guesses allowed
  max_incorrect_guesses <- 10
  # Tracking guesses and incorrect guesses
  guesses <- c()
  incorrect_guesses <- c()
  
  # Welcome message to user: inform them of the length of the secret word and how many guesses they are allowed
  cat("Welcome to Hangman!\n")
  cat("Your category is National Capitals.\n")
  cat("This secret word has", nchar(secretWord), "letters.\n")
  cat("Type a letter to make your first guess or guess the whole word on your first try.\n")
  cat("You have a total of", max_incorrect_guesses, "guesses available.\n")
  cat("Good luck!\n\n")
  
  # Create a game loop so the game is interactive
  while (TRUE) {
    displayProgress(word, guesses)
    cat("\n")
    
    # Get user input (letter or whole word)
    user_input <- tolower(readline(prompt = "Enter your guess (one letter or the whole word): "))
    
    # Give the option to user if they want to guess the whole word
    # The program assumes that if user inputs more than one letter, they are attempting to guess the whole word
    if (nchar(user_input) > 1) {
      if (tolower(user_input) == tolower(word)) {
        cat("Congratulations! You guessed the capital correctly. Thank you for playing. You are a true champion!\n")
      } else {
        # Once the word is guessed incorrectly, there are no more tries remaining, the secret word is revealed
        cat("Incorrect guess! The answer is:", word, "\n")
      }
      break
    }
    # Validation: Ensures that the user input is a letter
    if (!grepl("[a-z]", user_input) || nchar(user_input) != 1) {
      cat("Invalid entry. Please enter a single letter or the whole word. You got this!\n")
      next
    }
    
    # Additional functionality: Check if the letter has already been guessed
    if (user_input %in% guesses) {
      cat("You already guessed that letter. Please enter a new letter or guess the whole word\n")
      next
    }
    guesses <- c(guesses, user_input) # Adds the guess to the list of guesses for the program to recognize repeats
    
    # To verify if the user's letter guess is correct
    if (isCorrectGuess(word, user_input)) {
      cat("Correct guess!\n")
    } else {
      cat("Incorrect guess! Try again.\n")
      incorrect_guesses <- c(incorrect_guesses, user_input)
    }
    # Check if the game is won (by guessing letters only)
    if (all(strsplit(tolower(word), "")[[1]] %in% guesses)) {
      displayProgress(word, guesses)
      cat("Congratulations! You guessed the capital correctly. Thank you for playing. You are a true champion!\n")
      break
    }
    
    # Check if the game is lost (by exhausting tries)
    if (length(incorrect_guesses) >= max_incorrect_guesses) {
      displayProgress(word, guesses)
      cat("Game over! You did not guess the capital. The answer is:", word, "\n")
      break
    }
    
    # # Let the user know of remaining tries
    remaining_tries <- max_incorrect_guesses - length(incorrect_guesses)
    cat("Remaining tries:", remaining_tries, "\n")
    cat("\n")
  }
}

# Start the game with the selected word
playHangman(secretWord)
