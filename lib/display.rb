require_relative 'color.rb'

module Display

    def dir_files(directory)
        "Saved files: #{directory.join(', ')}"
    end

    def display_difficulty(difficulty)
        {
            '1' => 'EASY',
            '2' => 'MEDIUM',
            '3' => 'HARD'
        }[difficulty]
    end

    def display_instructions(option)
        {
            'get_guess' => 'Please enter a guess',
            'save_game?' => 'Do you want to save the game? (y/n)',
            'ask_save' => "Enter 'save' to save the game",
            'select_file' => 'Enter the name of the file that you want to load up',
            'name_save' => 'Enter the desired name for this save'
        }[option]
    end

    def letter_guesses(prev_list)
        letters = prev_list.filter{|letter| letter.length == 1}
        "Letters guessed: #{letters.join(' ')}"
    end

    def display_attempts(attempts)
        if attempts <= 3
            "#{attempts}".red
        else
            attempts
        end
    end

    def display_errors(error)
        {
            'failed_pick' => 'You did not enter any of the given options',
            'not_letter' => 'You did not enter a valid guess (please only enter alphabetical characters)',
            'already_guessed' => 'You already guessed this...',
            'one_letter' => 'You did not enter a letter',
            'invalid_file' => 'You did not enter an existing file',
            'save_file' => 'The name you entered already exists'
        }[error]
    end

    def display_banner
        puts '###############################'
        puts '       WELCOME TO HANGMAN      '
        puts '###############################'
    end

    def game_result(result, word)
        {
            'win' => "Congratulations! You guessed the word \"#{word.join('')}\"!",
            'lose' => "You lost! The word was \"#{word.join('')}\""
        }[result]
    end
end