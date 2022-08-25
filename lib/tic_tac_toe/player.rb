# frozen_string_literal: true

module TicTacToe
  # Player
  class Player
    attr_accessor :symbol, :choose, :type

    def initialize(symbol:, type: 'human')
      @symbol = symbol
      @type = type
    end

    def do_move
      @type == 'human' ? ask_move : 'not still working ...'
    end

    private

    def ask_move
      puts "(#{symbol}) - Choose a space from 1 to 9: "

      loop do
        @choose = gets.chomp.to_i

        break if valid_choose?
      end
    end

    def valid_choose?
      !/^(\d)+$/.match(@choose.to_s).nil? && @choose.positive? && @choose < 10
    end
  end
end
