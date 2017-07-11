class Game

  attr_accessor :game, :graph, :player_1, :player_2

  def initialize
    @game = Hangman.new
    @graph = Graphic.new
    self.game.welcome
    self.menu
  end

  def menu
    if self.game.players == "l"
      User.leaderboard
      Game.new
    elsif self.game.players == "x"
      exit
    else
      self.player_setup
    end
  end

  def player_setup
    self.player_1 = User.get_player_1_name
    self.player_1.load
    if game.players == "2"
      self.player_2 = User.get_player_2_name
      self.player_2.load
    end
    self.word_setup
  end

  def word_setup
    self.game.create_word(self.player_1.name.capitalize, (self.player_2.name.capitalize if self.game.players == "2"))
    self.game.get_difficulty if self.game.players == "1"
    self.game_loop
  end

  def game_loop
    while self.game.game_over == 0 do
      guess = self.game.prompt
      self.game.play(guess)
      self.game.loss_check(self.player_1)
      self.game.win_check(self.player_1)
      self.graph.graphic_selector(self.game.level, self.game.wrong_guess) if self.game.correct_guess == 0
    end
    self.save_and_show_records
  end

  def save_and_show_records
    self.player_1.save
    self.player_1.show_record
    if self.game.players == "2"
      self.player_2.save
      self.player_2.show_record
    end
    self.play_again?
  end

  def play_again?
    self.game.play_again
  end
end
