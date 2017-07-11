class Game

  attr_accessor :game, :graph, :player_1, :player_2

  def initialize
    @game = Hangman.new
    @graph = Graphic.new
    self.game.welcome
    self.menu
  end

  def menu
    case self.game.menu
    when "l"
      User.leaderboard
      Game.new
    when "x"
      exit
    when "1", "2"
      self.player_setup
    else
      puts "WRONG INPUT"
      Game.new
    end
  end

  def player_setup
    self.player_1 = User.get_player_1_name
    self.player_1.load
    if game.menu == "2"
      self.player_2 = User.get_player_2_name
      self.player_2.load
    end
    self.word_setup
  end

  def word_setup
    self.game.create_word(self.player_1.name.capitalize, (self.player_2.name.capitalize if self.game.menu == "2"))
    self.game.get_difficulty if self.game.menu == "1"
    self.game_loop
  end

  def game_loop
    while self.game.game_over == 0 do
      self.player_1.display_guessed_letters
      guess = self.game.prompt
      check_letter = self.player_1.check_guessed_letters(guess)
      if check_letter == 0
        self.play_game(guess)
      else
        self.game_loop
      end
    end
    self.save_and_show_records
  end

  def play_game(guess)
    self.game.play(guess)
    self.game.loss_check(self.player_1)
    self.game.win_check(self.player_1)
    self.graph.graphic_selector(self.game.level, self.game.wrong_guess) if self.game.correct_guess == 0
  end

  def save_and_show_records
    self.player_1.save
    self.player_1.show_record
    if self.game.menu == "2"
      self.player_2.save
      self.player_2.show_record
    end
    self.play_again?
  end

  def play_again?
    self.game.play_again
  end
end
