class Graphic

  attr_accessor :choice, :color

  def initialize
    @choice = nil
    @color = "red"
  end

  def graphic_selector(level, wrong_guess)
    case level
    when "e"
      change_color_easy
      easy_choice(wrong_guess)
    when "n"
      change_color_medium
      medium_choice(wrong_guess)
    when "h"
      self.choice = wrong_guess
    end
    graph
  end

  def medium_choice(wrong_guess)
    self.choice = (wrong_guess.to_f / 2).ceil
  end

  def easy_choice(wrong_guess)
    self.choice = (wrong_guess.to_f / 3).ceil
  end

  def change_color_easy
    case self.color
    when "green"
      self.color = "yellow"
    when "yellow"
      self.color = "red"
    when "red"
      self.color = "green"
    end
  end

  def change_color_medium
    case self.color
    when "green"
      self.color = "red"
    when "red"
      self.color = "green"
    end
  end

  def graph
    case choice
    when 1
      puts "
      ___________.._______
      | .__________))______|
      | | / /      ||
      | |/ /       ||
      | | /        ||
      | |/         ||
      | |          ||
      | |          ( `_.
      | |           `--'
      | |
      | |
      | |
      | |
      | |
      | |
      | |
      | |
      | |
      ----------|-----------|---|
      |-|-------|----------/ |-|
      | |                    | |
      : :                    : :  sk
      . .                    . .

      ".send(self.color)
    when 2
      puts "
      ___________.._______
      | .__________))______|
      | | / /      ||
      | |/ /       ||
      | | /        ||.-''.
      | |/         |/  _  \\
      | |          ||  `/,|
      | |          (\\\\`_.'
      | |         .-`--'.
      | |         \\ . . /
      | |          |   |
      | |          | . |
      | |          |   |
      | |
      | |
      | |
      | |
      | |
      ----------|-----------|---|
      |-|-------|----------/ |-|
      | |                    | |
      : :                    : :  sk
      . .                    . .

      ".send(self.color)
    when 3
      puts "
      ___________.._______
      | .__________))______|
      | | / /      ||
      | |/ /       ||
      | | /        ||.-''.
      | |/         |/  _  \\
      | |          ||  `/,|
      | |          (\\\\`_.'
      | |         .-`--'.
      | |         Y . . Y\\
      | |          |   | \\\\
      | |          | . |  \\\\
      | |          |   |   (`
      | |
      | |
      | |
      | |
      | |
      ----------|-----------|---|
      |-|-------|----------/ |-|
      | |                    | |
      : :                    : :  sk
      . .                    . .

      ".send(self.color)
    when 4
      puts "
      ___________.._______
      | .__________))______|
      | | / /      ||
      | |/ /       ||
      | | /        ||.-''.
      | |/         |/  _  \\
      | |          ||  `/,|
      | |          (\\\\`_.'
      | |         .-`--'.
      | |        /Y . . Y\\
      | |       // |   | \\\\
      | |      //  | . |  \\\\
      | |     ')   |   |   (`
      | |
      | |
      | |
      | |
      | |
      ----------|-----------|---|
      |-|-------|----------/ |-|
      | |                    | |
      : :                    : :  sk
      . .                    . .

      ".send(self.color)
    when 5
      puts "
      ___________.._______
      | .__________))______|
      | | / /      ||
      | |/ /       ||
      | | /        ||.-''.
      | |/         |/  _  \\
      | |          ||  `/,|
      | |          (\\\\`_.'
      | |         .-`--'.
      | |        /Y . . Y\\
      | |       // |   | \\\\
      | |      //  | . |  \\\\
      | |     ')   |   |   (`
      | |          ||
      | |          ||
      | |          ||
      | |          ||
      | |         / |
      ----------|-----------|---|
      |-|-------|----------/ |-|
      | |                    | |
      : :                    : :  sk
      . .                    . .

      ".send(self.color)
    when 6
      puts "
       ___________.._______
      | .__________))______|
      | | / /      ||
      | |/ /       ||
      | | /        ||.-''.
      | |/         |/  _  \\
      | |          ||  `/,|
      | |          (\\\\`_.'
      | |         .-`--'.
      | |        /Y . . Y\\
      | |       // |   | \\\\
      | |      //  | . |  \\\\
      | |     ')   |   |   (`
      | |          ||-||
      | |          || ||
      | |          || ||
      | |          || ||
      | |         / | | \\
      ----------|_`-' `-' |---|
      |-|-------\\\\         |-|
      | |        \\\\        | |
      : :         \\\\       : :  sk
      . .          `'      . .

      ".send(self.color)
    end
  end
end
