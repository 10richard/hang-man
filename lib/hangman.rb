require_relative 'display.rb'

class Hangman
    include Display

    def initialize(word)
        @guess = ''
        @attempts_left = 7
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
            puts letter_guesses(@prev_guesses)
            puts word_guesses(@prev_guesses)
            until @valid_guess
                puts @hidden_key.join(' ')
                @guess = get_guess()
                check_validity
            end
            check_guess
            modify_key?
            @valid_guess = false
            end_game?
        end
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
        gets.chomp
    end

    def check_validity
        #checks if guess is alphabetical
        #checks if guess is in previously guessed list (if it is then ask for another guess)
        #if guess is a word, then it will check if it is a real english word (using google txt file)
        if @guess[/[a-zA-Z]+/] == @guess
            if @guess.length > 1 && !@prev_guesses.include?(@guess)
                if @guess.length == @secret_word.length
                    word_file = File.open('google-10000-english-no-swears.txt', 'r')

                    word_file = word_file.readlines

                    if word_file.include?("#{@guess}\n")
                        @valid_guess = true
                    else
                        puts display_errors('word_guess')
                    end
                elsif @guess.length < @secret_word.length
                    puts display_errors('short_word')
                elsif @guess.length > @secret_word.length
                    puts display_errors('long_word')
                end
            elsif !@prev_guesses.include?(@guess)
                @valid_guess = true
            else
                puts display_errors('already_guessed')
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
        end
    end

    def save_info
        #will serialize: previously guess list, attempts left, and hidden word
        #tbh have 0 clue what I will do here, but we move :)
    end
end