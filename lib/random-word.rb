require_relative 'display.rb'

class RandomWord
    include Display

    attr_accessor :word

    @@valid_modes = ['1', '2', '3']

    def initialize
        @word = get_word
        @word_length = ''
        @valid_difficulty = false
    end

    def get_word
        display_banner
        until @valid_difficulty
            puts "Choose a difficulty:"
            puts
            puts "Easy = 1 | Medium = 2 | Hard = 3"
            difficulty = gets.chomp.to_s
            check_difficulty(difficulty)
        end

        word = generate_word
        word
    end

    def check_difficulty(difficulty)
        if @@valid_modes.include?(difficulty)
            puts "Difficulty chosen: #{display_difficulty(difficulty)}"
            @word_length = get_word_length(difficulty)
            @valid_difficulty = true
        else
            puts display_errors('failed_pick')
        end
    end

    def get_word_length(difficulty)
        {
            '1' => 4,
            '2' => 8,
            '3' => 12
        }[difficulty]
    end

    def generate_word
        word_file = File.open('google-10000-english-no-swears.txt', 'r')

        word_file = word_file.readlines.shuffle

        word = word_file.detect{|line| line.rstrip.length == @word_length}
        word.rstrip
    end
end