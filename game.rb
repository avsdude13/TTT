=begin
Title:  Ruby TicTacToe Game
Authors: Adonis Muminovic, Matt Kline, and William Quinn
Class: Comp Sci 1030 MW @ 10-12

This class functions as the actual playing of the tic tac toe game and works off the board created through the board.rb class.
It will mainly work with player interacting methods and make calls upon the board related method from the previous class.
=end

require_relative 'board.rb'

class Game

  PLAYERS = %w{X O}
  @current_player
  @board

  def initialize(starting_player)
    if starting_player.to_s.empty?
      @current_player = 'X'
    else
      @current_player = starting_player
    end
  end

  def play
    puts 'Starting Tic-Tac-Toe'
    puts 'Created by Adonis Muminovic'
    puts '           Matt Kline'
    puts '           William Quinn'

    @board = Board.new(@current_player)
    @board.display

    game_over = false
    until game_over
      ask_player_for_move

      if @board.winner
        @board.display
        puts "Player #{@board.get_winner} wins."
        game_over = true
      elsif @board.board_full
        puts 'Tie Game'
        game_over = true
      else
        puts ''
        next_player
      end
    end
    puts 'Game Over'
  end

  def ask_player_for_move
    played = false
    until played
      puts "Player #{@current_player}: Where would you like to play?"
      player_selection = gets.chomp.to_i - 1

      row = player_selection / @board.size
      column = player_selection % @board.size
      if @board.validate_position(row, column)
        @board.fill_position(row, column, @current_player)
        @board.display
        played = true
      end
    end
  end

  def next_player
    if @current_player == 'X'
      @current_player = 'O'
    else
      @current_player = 'X'
    end
  end

end