`#!/usr/bin/env ruby`
require_relative './hangman.rb'

def order_66
  game = Hangman.new
  game.welcome
  game.create_word
  game.get_difficulty if game.players == "1"
  while game.game_over == 0 do #another method
    guess = game.prompt
    game.play(guess)
    game.progress_check
  end
  game.play_again
end

# order_66
