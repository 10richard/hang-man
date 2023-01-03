require './lib/random-word.rb'
require './lib/hangman.rb'
require './lib/display.rb'
require 'json'

include Display

def load_game
    if Dir.empty?('./saved_files')
        puts "There are no saved files on record"
        new_game()
    else
        puts saved_files
        
    end

    #Hangman.new.load_json(file).play
end

def new_game
    word = RandomWord.new()
    game = Hangman.new(word.word).play
end

def choose_game(input)
    if input == '1'
        new_game()
    elsif input == '2'
        load_game()
    else
        'ERROR: choose_game() problem'
    end
end

def main
    valid_inputs = ['1', '2']
    puts
    puts "New game = 1 | Load game = 2"
    input = gets.chomp

    until valid_inputs.include?(input)
        puts display_instructions('failed_pick')
        input = gets.chomp
    end
    choose_game(input)
end

display_banner()
main()