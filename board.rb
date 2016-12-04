class Board

  BOARD_MAX_INDEX = 2
  EMPTY_POSITION = ' '

  def initialize(starting_player)
    @current_player = current_player
    @board = Array.new(BOARD_MAX_INDEX + 1) {Array.new(BOARD_MAX_INDEX + 1, EMPTY_POSITION)}
  end

  def display
    puts '+- - - - - -+'
    for row in 0..BOARD_MAX_INDEX
      print '| '
      for column in 0..BOARD_MAX_INDEX
        if @board[row][column] == EMPTY_POSITION
          print column + (row * 3) + 1
        else
          print @board[row][column]
        end
        print ' | '
      end
      puts "\n+- - - - - -+"
    end
  end

  def board_full
    for row in 0..BOARD_MAX_INDEX
      for column in 0..BOARD_MAX_INDEX
        if @board[row][column] == EMPTY_POSITION
          return false
        end
      end
    end
  end

  def winner
    if winner == winner_columns || winner == winner_rows || winner == winner_diagonals
        return winner
    end
  end

  def winner_columns
    for column in 0..BOARD_MAX_INDEX
      to_find = @board[0][column]
      if to_find == EMPTY_POSITION
        next
      end
      for row in 0..BOARD_MAX_INDEX
        if to_find != @board[row][column]
          break
        elsif row == BOARD_MAX_INDEX
          return to_find
        end
      end
    end
  end

  def winner_rows
    for row in 0..BOARD_MAX_INDEX
      to_find = @board[row][0]
      if to_find == EMPTY_POSITION
        next
      end
      for column in 0..BOARD_MAX_INDEX
        if to_find != @board[row][column]
          break
        elsif column == BOARD_MAX_INDEX
          return to_find
        end
      end
    end
  end

  def winner_diagonals
    for index in 0..BOARD_MAX_INDEX
      to_find = @board[0][0]
      if to_find == EMPTY_POSITION
        break
      end
        if to_find != @board[index][index]
          break
        elsif index == BOARD_MAX_INDEX
          return to_find
        end
    end

    for index in 0..BOARD_MAX_INDEX
      to_find = @board[0][3]
      if to_find == EMPTY_POSITION
        break
      end
      if to_find != @board[index][(BOARD_MAX_INDEX + 1) - index]
        break
      elsif index == BOARD_MAX_INDEX
        return to_find
      end
    end
  end

  def validate_position(row, column)
    if row <= BOARD_MAX_INDEX && column <= BOARD_MAX_INDEX
      if @board[row][column] == EMPTY_POSITION
        return true
      else
        return false
      end
    end
  end

  def fill_position(row, column, player)
    @board[row][column] = player
  end

end