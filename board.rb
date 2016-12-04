class Board

  BOARD_MAX_INDEX = 2
  EMPTY_POSITION = ' '
  @winning_player

  def initialize(starting_player)
    @current_player = starting_player
    @board = Array.new(BOARD_MAX_INDEX + 1) {Array.new(BOARD_MAX_INDEX + 1, EMPTY_POSITION)}
  end

  def size
    BOARD_MAX_INDEX + 1
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
    if winner_rows
      return true
    elsif winner_columns
      return true
    elsif winner_diagonals
      return true
    else
      return false
    end
  end

  def get_winner
    return @winning_player
  end

  def winner_rows
    puts 'rows win check'
    for row in 0..BOARD_MAX_INDEX
      to_find = @board[row][0]
      if to_find == EMPTY_POSITION
        next
      end
      for column in 0..BOARD_MAX_INDEX
        if to_find != @board[row][column]
          break
        elsif column == BOARD_MAX_INDEX && to_find != EMPTY_POSITION
          @winning_player = to_find
          return true
        end
      end
    end
    return false
  end

  def winner_columns
    puts 'columns win check'
    for column in 0..BOARD_MAX_INDEX
      to_find = @board[0][column]
      if to_find == EMPTY_POSITION
        next
      end
      for row in 0..BOARD_MAX_INDEX
        if to_find != @board[row][column]
          break
        elsif row == BOARD_MAX_INDEX && to_find != EMPTY_POSITION
          @winning_player = to_find
          return true
        end
      end
    end
    return nil
  end

  def winner_diagonals
    puts 'diagonals win check'
    for index in 0..BOARD_MAX_INDEX
      to_find = @board[0][0]
      if to_find == EMPTY_POSITION
        break
      end
        if to_find != @board[index][index]
          break
        elsif index == BOARD_MAX_INDEX && to_find != EMPTY_POSITION
          @winning_player = to_find
          return true
        end
    end

    for index2 in 0..BOARD_MAX_INDEX
      to_find = @board[0][2]
      if to_find == EMPTY_POSITION
        break
      end
      if to_find != @board[index2][BOARD_MAX_INDEX - index2]
        return false
      elsif index2 == BOARD_MAX_INDEX
        @winning_player = to_find
        return true
      end
    end
    return false
  end

  def validate_position(row, column)
    if row >= 0 && row <= BOARD_MAX_INDEX && column >= 0 && column <= BOARD_MAX_INDEX
      if @board[row][column] == EMPTY_POSITION
        return true
      else
        puts 'Position occupied'
      end
    else
      puts ' Invalid position'
      end
  end

  def fill_position(row, column, player)
    @board[row][column] = player
  end

end