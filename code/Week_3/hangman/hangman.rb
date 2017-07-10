require "pry"
require 'random-word'
require 'highline/import'

class Hangman

  attr_accessor :wrong_guess, :result, :game_over, :word, :progress, :players, :chances

  def initialize
    @wrong_guess = 0
    @game_over = 0
    @chances = 7
  end

  def welcome
    puts "HANGMAN!
    1 or 2 players? 'x' to exit"
    self.players = gets.chomp
  end

  def create_word
    case self.players
    when "1"
      self.word = RandomWord.adjs.next.split("_")[0]
    when "2"
      puts "Player 1: Enter your word"              # another method
      self.word = ask("Word: ") { |q| q.echo="*"}
      puts "Player 2: Don't get Hanged!"
    when "x"
      exit
    end
    self.progress = ("_"* self.word.length).chars
  end

  def get_difficulty
    level = nil
    while !(level == "e" || level == "n" || level == "h")
      puts "Select Difficulty: 'e' Easy, 'n' Normal, 'h' Hard."
      level = gets.chomp
    end
    set_difficulty(level)
  end

  def set_difficulty(level) #private
    case level
    when "e"
      self.chances = 20
    when "n"
      self.chances = 10
    when "h"
      self.chances = 5
    end
  end

  def prompt
    display
    puts "Guess a character a-z!"
    guess = gets.chomp.downcase
  end

  def play(guess)
    correct_guess = 0
    self.word.chars.each_with_index do |letter, index| #another method
      if letter == guess
        self.progress[index] = letter
        correct_guess = 1
      end
    end
    if correct_guess == 0
      self.wrong_guess += 1
      puts "You got #{self.wrong_guess} wrong, out of #{self.chances} chances."
    end
  end

  def progress_check
    if self.wrong_guess >= self.chances #2 methods
      puts "You Lose!"
      puts self.word
      self.result = "loss"
      self.game_over = 1
    elsif self.progress.join == self.word
      puts "You Win!"
      self.result = "won"
      display
      self.game_over = 1
    end
  end

  def display
    puts  self.progress.join
  end

  def play_again
    puts "Play Again? [y/n]"
    order_66 if gets.chomp == "y"
  end

end
