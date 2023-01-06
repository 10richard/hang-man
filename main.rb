require './lib/hangman.rb'
require './lib/display.rb'

include Display

def choose_game(input)
    if input == '1'
        game = Hangman.new(true).play
    elsif input == '2'
        game = Hangman.new(false).play
    else
        'ERROR: choose_game() problem'
    end
end

def main
    display_banner()
    valid_inputs = ['1', '2']
    puts
    puts "New game = 1 | Load game = 2"
    input = gets.chomp

    until valid_inputs.include?(input)
        puts display_errors('failed_pick')
        input = gets.chomp
    end
    choose_game(input)
end

main()