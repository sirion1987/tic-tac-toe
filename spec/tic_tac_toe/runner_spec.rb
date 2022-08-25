# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe TicTacToe::Runner do
  subject(:runner) { described_class.start! }
  let(:game) { instance_double(TicTacToe::Game) }

  before do
    allow(TicTacToe::Game).to receive(:new) { game }
    allow(game).to receive(:play) { nil }
  end

  it 'responds to .start!' do
    expect(described_class).to respond_to(:start!)
  end

  context 'with stalled game' do
    let(:game) { instance_double(TicTacToe::Game, status: :stalled) }

    it 'shows stalled message' do
      expect { runner }.to output(a_string_including('Stall')).to_stdout
    end
  end

  context 'with a winner' do
    let(:current_player) do
      instance_double(TicTacToe::Player, symbol: 'X')
    end
    let(:game) do
      instance_double(
        TicTacToe::Game,
        status: :finished,
        current_player: current_player
      )
    end

    it 'shows win message' do
      expect { runner }.to output(a_string_including('X')).to_stdout
    end
  end
end
# rubocop:enable Metrics/BlockLength
