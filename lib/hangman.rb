require_relative 'display.rb'
require 'json'

class Hangman
    include Display

    def initialize(word)
        @guess = ''
        @attempts_left = 10
        @secret_word = word.split('')
        @hidden_key = Array.new(@secret_word.length, '_')
        @valid_guess = false
        @game_over = false
        @winner = false
        @prev_guesses = []
    end

    def play
        #will run all methods here
        until @game_over
            puts
            puts "Attempts left: #{display_attempts(@attempts_left)}"
            puts letter_guesses(@prev_guesses)
            until @valid_guess
                puts @hidden_key.join(' ')
                puts
                @guess = get_guess()
                check_validity
            end
            check_guess
            modify_key?
            @valid_guess = false
            end_game?
        end
        puts @winner == true ? game_result('win', @secret_word) : game_result('lose', @secret_word)
    end

    def modify_key?
        #will display underscores/letters correctly guessed
        #checks previously guessed list, then will permanently change underscore if there are any matches
        word = @secret_word.dup
        count = 0
        if @secret_word.include?(@guess)
            word.each do |letter|
                if letter == @guess
                    @hidden_key[count] = @guess
                end
                count += 1
            end
        end
    end

    def get_guess
        puts display_instructions('get_guess')
        puts display_instructions('ask_save')
        gets.chomp
    end

    def check_validity
        #checks if guess is alphabetical
        #checks if guess is in previously guessed list (if it is then ask for another guess)
        #if guess is a word, then it will check if it is a real english word (using google txt file)
        if @guess[/[a-zA-Z]+/] == @guess
            if !@prev_guesses.include?(@guess) && @guess.length == 1
                @valid_guess = true
            elsif @guess == 'save'
                validate_save
            elsif @guess.length > 1 || @guess.length < 1
                puts
                puts display_errors('one_letter')
                puts
            else
                puts
                puts display_errors('already_guessed')
                puts
                puts "Attempts left: #{display_attempts(@attempts_left)}"
                puts letter_guesses(@prev_guesses)
            end
        else
            puts display_errors('not_letter')
        end
    end

    def check_guess
        #convert string (guess) into list and see if it matches with hidden word (if yes, then player wins)
        #if player guessed letter, then check if secret word includes the letter
        #if guess is wrong then subtract attempts by 1, otherwise do nothing
        if @guess.split('') == @secret_word
            @game_over = true
            @winner = true
        elsif @secret_word.include?(@guess)
            @prev_guesses.push(@guess)
        else
            @prev_guesses.push(@guess)
            @attempts_left -= 1
        end
    end

    def end_game?
        if @attempts_left == 0
            @game_over = true
        elsif @hidden_key.none?('_')
            @game_over = true
            @winner = true
        end
    end

    def validate_save
        valid_answers = ['y', 'n']
        puts display_instructions('save_game?')
        answer = gets.chomp
        until valid_answers.include?(answer)
            puts display_errors('failed_pick')
            puts 'Enter y or n'
            answer = gets.chomp
        end

        if answer == 'y'
            save_game
        elsif answer == 'n'
            return
        else
            puts 'What did you do >:('
        end
    end

    def save_game
        #will serialize: previously guess list, attempts left, and hidden word
        #tbh have 0 clue what I will do here, but we move :)
        
    end

    def to_json
        JSON.dump ({
            guess: @guess,
            attempts_left: @attempts_left,
            secret_word: @secret_word,
            hidden_key: @hidden_key,
            prev_guesses: @prev_guesses
        })
    end

    def load_json(string)
        data = JSON.load(string)
        @guess = data[:guess]
        @attempts_left = data[:attempts_left]
        @secret_word = data[:secret_word]
        @hidden_key = data[:hidden_key]
        @prev_guesses = data[:prev_guesses]
    end
end