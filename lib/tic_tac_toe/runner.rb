# frozen_string_literal: true

module TicTacToe
  # Runner
  class Runner
    attr_accessor :game

    def initialize
      @game = TicTacToe::Game.new
    end

    def self.start!
      new.call
    end

    def call
      loop do
        game.play

        break if game.status == :finished || game.status == :stalled
      end

      game.status == :finished ? print_winner : print_stall
    end

    private

    def print_winner
      puts "#{game.current_player.symbol} win the game!"
    end

    def print_stall
      puts 'Stall :/'
    end
  end
end
