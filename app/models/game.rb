class Game
  attr_reader :moves
  attr_accessor :current_player

  def initialize(moves)
    @moves = moves || new_board
  end

  def make_move(game_params)
    self.current_player = game_params["player"]
    add_move(game_params)
  end

  def draw?
    open_spaces.length == 0
  end

  def win?(player)
    win_lines.values.each do |win_line|
      win = win_line.select do |move|
        moves[move] == player
      end
      return true if win.sort == win_line
    end
    false
  end

  def winner(player)
    if player == "o"
      "Player O wins!"
    else
      "Player X wins!"
    end
  end

  private

    def add_move(game_params)
      moves[game_params["move"]] = current_player
    end

    def open_spaces
      moves.select do |move, player|
        player == nil
      end
    end



    def win_lines
      { r1: ["1", "2", "3"],
        r2: ["4", "5", "6"],
        r3: ["7", "8", "9"],
        c1: ["1", "4", "7"],
        c2: ["2", "5", "8"],
        c3: ["3", "6", "9"],
        d1: ["1", "5", "9"],
        d2: ["3", "5", "7"]
      }
    end

    def new_board
      { "1" => nil,
        "2" => nil,
        "3" => nil,
        "4" => nil,
        "5" => nil,
        "6" => nil,
        "7" => nil,
        "8" => nil,
        "9" => nil
      }
    end
end
