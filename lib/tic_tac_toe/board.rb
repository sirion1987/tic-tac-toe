# frozen_string_literal: true

module TicTacToe
  # Board
  class Board
    ROWS = 3
    COLUMNS = 3

    attr_accessor :grid

    def initialize(grid: nil)
      @grid = grid || Array.new(9) { nil }
    end

    def update_grid(choose, symbol)
      grid[choose - 1] = symbol
    end

    def print_grid
      puts "\n-------------\n"

      ROWS.times do |row|
        print '|'
        COLUMNS.times do |column|
          print " #{grid[(row * ROWS) + column] || ' '} |"
        end

        puts "\n-------------"
      end
    end

    def valid_move?(choose)
      grid[choose - 1].nil?
    end

    def chooses(symbol)
      grid.map.with_index { |x, i| x == symbol ? i : nil }.compact.sort
    end

    def total_moves
      grid.count { |element| !element.nil? }
    end
  end
end
