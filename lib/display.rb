module Display

    def display_difficulty(difficulty)
        {
            '1' => 'EASY',
            '2' => 'MEDIUM',
            '3' => 'HARD'
        }[difficulty]
    end

    def display_errors(error)
        {
            
        }[error]

    def display_banner
        puts '###############################'
        puts '       WELCOME TO HANGMAN      '
        puts '###############################'
    end
end