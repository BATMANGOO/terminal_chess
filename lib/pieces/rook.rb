class Rook < Piece
  def move_set
    [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0]
    ]
  end

  def to_s
    color == :white ? '♜' : '♖'
  end

  def available_moves
    moves = []

    move_set.each do |(dr, dc)|
      current_r, current_c = position

      loop do
        current_r += dr
        current_c += dc
        pos = [current_r, current_c]
        break unless board.in_bounds?(pos)

        if board.empty?(pos)
          moves << pos
        end
        if enemy?(pos)
          moves << pos
          break
        end
      end
    end
    moves
  end
end
