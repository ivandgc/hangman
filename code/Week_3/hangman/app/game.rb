def order_66
  game = Hangman.new #setup method
  graph = Graphic.new
  game.welcome
  if game.players == "l"
    User.leaderboard
    order_66
  elsif game.players == "x"
    exit
  else
    player_1 = User.get_player_1_name #another method
    player_1.load
    if game.players == "2"
      player_2 = User.get_player_2_name
      player_2.load
    end
    game.create_word(player_1.name.capitalize, (player_2.name.capitalize if game.players == "2"))
    game.get_difficulty if game.players == "1"
    while game.game_over == 0 do #another method
      guess = game.prompt
      game.play(guess)
      game.progress_check(player_1)
      graph.graphic_selector(game.level, game.wrong_guess) if game.correct_guess == 0
    end
    player_1.save #another method
    player_1.show_record
    if game.players == "2"
      player_2.save
      player_2.show_record
    end
    game.play_again
  end
end
