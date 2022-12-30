module Display

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
        }
    end

    def display_word

    def display_errors(error)
        {
            'failed_pick' => 'You did not enter any of the given options',
        }[error]

    def display_banner
        puts '###############################'
        puts '       WELCOME TO HANGMAN      '
        puts '###############################'
    end
end