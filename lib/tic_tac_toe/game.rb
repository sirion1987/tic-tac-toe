# frozen_string_literal: true

module TicTacToe
  # Game orchestrator
  class Game
    attr_accessor :status, :moves, :box, :current_player, :board

    WIN_MOVES = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ].freeze

    def initialize(grid: nil)
      @status = :ok
      @player1 = Player.new(symbol: 'X')
      @player2 = Player.new(symbol: 'O')
      @current_player = @player1
      @board = Board.new(grid: grid)
    end

    def play
      do_move
      print_grid

      @status = :finished if win_game?
      @status = :stalled if board.total_moves > 8

      change_player if @status == :ok
    end

    private

    def do_move
      loop do
        @current_player.do_move

        break if board.valid_move?(current_player.choose)
      end

      board.update_grid(@current_player.choose, current_player.symbol)
    end

    def win_game?
      moves = board.chooses(@current_player.symbol)
      combinations = moves.combination(3).map { |move| WIN_MOVES.include? move }

      combinations.any? true
    end

    def change_player
      @current_player = current_player.symbol == 'X' ? @player2 : @player1
    end

    def print_grid
      board.print_grid
    end
  end
end
