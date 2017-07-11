class Hangman

  attr_accessor :wrong_guess, :result, :game_over, :word, :progress, :players, :chances, :level, :correct_guess

  def initialize
    @wrong_guess = 0
    @game_over = 0
    @chances = 6
    @level = "h"
  end

  def welcome
    puts "HANGMAN!
    1 or 2 players? 'l' for Leaderboard 'x' to Exit"
    self.players = gets.chomp
  end

  def create_word(name_1, name_2 = nil)
    case self.players
    when "1"
      self.word = RandomWord.adjs.next.split("_")[0]
    when "2"
      puts "#{name_2}: Enter your word"              # another method
      self.word = ask("Word: ") { |q| q.echo="*"}
      puts "#{name_1}: Don't get Hanged!"
    end
    self.progress = ("_"* self.word.length).chars
  end

  def get_difficulty
    self.level = nil
    while !(self.level == "e" || self.level == "n" || self.level == "h")
      puts "Select Difficulty: 'e' Easy, 'n' Normal, 'h' Hard."
      self.level = gets.chomp
    end
    set_difficulty
  end

  def set_difficulty #private
    case self.level
    when "e"
      self.chances = 18
    when "n"
      self.chances = 12
    when "h"
      self.chances = 6
    end
  end

  def prompt
    display
    puts "Guess a character a-z!"
    guess = gets.chomp.downcase
  end

  def play(guess)
    self.correct_guess = 0
    self.word.chars.each_with_index do |letter, index| #another method
      if letter == guess
        self.progress[index] = letter
        self.correct_guess = 1
      end
    end
    if self.correct_guess == 0
      self.wrong_guess += 1
      puts "You got #{self.wrong_guess} wrong, out of #{self.chances} chances."
    end
  end

  def progress_check(player)
    if self.wrong_guess >= self.chances #2 methods
      puts "You Lose!"
      puts self.word
      player.loses += 1
      self.game_over = 1
    elsif self.progress.join == self.word
      puts "You Win!"
      player.wins += 1
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
