require 'pry'

class TicTacToe
  def initialize
  end

  def winner?(player, board)
    player_spots = grab_positions(player, board)
    return true if vertical_win(player_spots) == true
    return true if horizontal_win(player_spots) == true
    return true if diagnal_win(player_spots) == true
    return false
  end

  def vertical_win(player_spots)
    return true if (player_spots & ["00", "10", "20"]).length == 3
    return true if (player_spots & ["01", "11", "21"]).length == 3
    return true if (player_spots & ["02", "12", "22"]).length == 3
  end

  def horizontal_win(player_spots)
    return true if (player_spots & ["00", "01", "02"]).length == 3
    return true if (player_spots & ["10", "11", "12"]).length == 3
    return true if (player_spots & ["20", "21", "22"]).length == 3
  end

  def diagnal_win(player_spots)
    return true if (player_spots & ["00", "11", "22"]).length == 3
    return true if (player_spots & ["02", "11", "20"]).length == 3
  end

  def grab_positions(player, board)
    player_spots = []
    board.each_with_index do |row, row_index|
      row.each_with_index do |element, col_index|
        if element == player
          player_spots << "#{row_index}" + "#{col_index}"
        end
      end
    end
    return player_spots
  end

end

player_1 = "x"
player_2 = "o"
board = [
   ['x','x','o'],
   ['-','-','x'],
   ['x','o','x']
 ]
board_2 = [
   ['x','x','o'],
   ['o','o','x'],
   ['o','x','x']
 ]

game = TicTacToe.new
print game.winner?(player_1, board)
print game.winner?(player_2, board_2)
