require_relative 'display.rb'

class Hangman
    include Display

    def initialize(word)
        @guess = ''
        @attempts_left = 7
        @secret_word = word.split('')
        @valid_guess = false
        @previously_guess = []
    end

    def play
        #will run all methods here

        #until valid_guess
            #@guess = get_guess
            #check_validity(@guess)
        #end
    end

    def secret_word
        #will display underscores/letters correctly guessed
        #checks previously guessed list, then will permanently change underscore if there are any matches
    end

    def get_guess
        #puts display_instructions('get_guess')
        #gets.chomp
    end

    def check_validity
        #checks if guess is alphabetical
        #checks if guess is in previously guessed list (if it is then ask for another guess)
        #if guess is a word, then it will check if it is a real english word (using google txt file)
        #if everything checks out, then subtract attempts by 1
    end

    def check_guess
        #convert string (guess) into list and see if it matches with hidden word (if yes, then player wins)
        #if player guessed letter, then check if secret word includes the letter
    end

    def end_game
        #displays if player lost or won
    end

    def save_info
        #will serialize: previously guess list, attempts left, and hidden word
        #tbh have 0 clue what I will do here, but we move :)
    end
end