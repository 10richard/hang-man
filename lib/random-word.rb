require './display.rb'

class RandomWord
    include Display

    @@valid_modes = ['1', '2', '3']

    def initialize
        @word = get_word()
        @word_length= 0
        @valid_difficulty = false
        @word_file = File.open('../google-10000-english-no-swears.txt')
    end

    def get_word
        while @valid_difficulty
            puts "Choose a difficulty"
            puts "Easy = 1 | Medium = 2 | Hard = 3"
            difficulty = gets.chomp
            check_difficulty(difficulty)
        end

        @word_file = @word_file.readlines.shuffle.join
        word = @word_file.each_line do |line|
            if line.length == @word_length
                return line.rstrip()
        word
    end

    def check_difficulty(difficulty)
        if difficulty in @@valid_modes
            puts "Difficulty chosen: #{display_difficulty(difficulty)}"
            get_word_length(difficulty)
            @valid_difficulty = true
        else
            puts "You did not enter a valid option"
        end
    end

    def get_word_length(difficulty)
        if difficulty == '1'
            @word_length = 4
        elsif difficulty == '2'
            @word_length = 8
        elsif difficulty == '3'
            @word_length == 12
        else
            puts 'COULDN\'T GET DIFFICULTY'
    end
end