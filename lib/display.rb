module Display

    def display_difficulty(difficulty)
        if difficulty == '1'
            'EASY'
        elsif difficulty == '2'
            'MEDIUM'
        elsif difficulty == '3'
            'HARD'
        else
            'ERROR: CAN\'T DISPLAY DIFFICULTY'
    end
end