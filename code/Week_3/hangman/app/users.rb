class User

  attr_accessor :name, :wins, :loses, :letters

  @@store = PStore.new("./app/data_file.pstore")

  def initialize(name)
    @name = name
    @wins = 0
    @loses = 0
    @letters = []
  end

  def self.get_player_1_name
    puts "Enter Guesser name:"
    name = gets.chomp.downcase
    User.new(name)
  end

  def self.get_player_2_name
    puts "Enter Word Setter name:"
    name = gets.chomp.downcase
    User.new(name)
  end

  def check_guessed_letters(guess)
    if (guess.length > 1)
      puts "GUESS ONLY 1 CHARACTER"
      1
    elsif self.letters.include?(guess)
      puts "YOU ALREDY GUESSED THAT"
      1
    else
      save_guessed_letters(guess)
      0
    end
  end

  def save_guessed_letters(guess)
    self.letters << guess
  end

  def display_guessed_letters
    if ! self.letters.empty?
      display_letters = self.letters.collect {|l| l}.join(", ")
      puts "Guessed letters: #{display_letters}"
    end
  end

  def self.store
    @@store
  end

  def public_store
    self.class.store
  end

  def show_record
    puts "#{self.name.capitalize} - Wins: #{self.wins} Loses: #{self.loses}"
  end

  def load
    self.public_store.transaction do
      player = public_store[self.name.to_sym]
      if ! player.nil?
        self.wins = player[0]
        self.loses = player[1]
      end
    end
  end

  def self.leaderboard
    board = {}
    store.transaction do
      store.roots.each do |root_key|
        board[root_key] = store[root_key]
      end
    end
    sorted_board = sort_leaderboard(board).to_h
    show_leaderboard(sorted_board)
  end

  def self.sort_leaderboard(board)
    board.sort_by {|name, record| record[0]}.reverse.sort_by {|name, win| win[0]}.reverse
  end

  def self.show_leaderboard(board)
    board.keys.each do |name|
      find_by_name(name).show_record
    end
  end

  def self.find_by_name(name)
    store.transaction do
      player = User.new(name.to_s)
      root = store[name]
      player.wins = root[0]
      player.loses = root[1]
      player
    end
  end


  def save
    public_store.transaction do
      public_store[self.name.to_sym] = [self.wins, self.loses]
    end
  end

end
