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
#Introduce the game to user and inform them of the length of the secret word and how many guesses they are allowed
print(paste("Welcome to Hangman! The category for this game is National Capitals. The secret word you need to guess has a total of", nchar(secretWord), "letters. Start by typing a letter to make your first guess. You have a total of 10 guesses available. Good luck!"))


##TO DO: 
#* inform of remaining tries
#* ensure character entered is letter 
#* Both capital and lowercase letters are accepted 
#* inform user of incorrect or correct tries - graphical representation?? 