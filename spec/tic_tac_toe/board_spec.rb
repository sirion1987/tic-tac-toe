# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe TicTacToe::Board do
  subject { described_class.new(grid: current_grid) }

  describe '.update_grid' do
    let(:current_grid) { ['X', nil, nil, nil, nil, nil, nil, nil, nil] }
    let(:new_grid) { ['X'] + Array.new(8) }

    before do
      subject.update_grid(1, 'X')
    end

    it 'returns updated grid' do
      expect(subject.grid).to eq(new_grid)
    end
  end

  describe '.print_grid' do
    let(:current_grid) { ['X', nil, nil, nil, nil, nil, nil, nil, nil] }

    before do
      subject.update_grid(1, 'X')
    end

    it 'shows the grid on stdout' do
      expect { subject.print_grid }.to output(a_string_including('X')).to_stdout
    end
  end

  describe '.valid_move?' do
    let(:current_grid) { ['X', nil, nil, nil, nil, nil, nil, nil, nil] }

    it 'returns true' do
      expect(subject.valid_move?(2)).to eq(true)
    end

    context 'without a valid move' do
      it 'returns false' do
        expect(subject.valid_move?(1)).to eq(false)
      end
    end
  end

  describe '.chooses' do
    let(:current_grid) { ['X', 'X', nil, 'X', nil, nil, nil, nil] }

    it 'returns X positions' do
      expect(subject.chooses('X')).to eq([0, 1, 3])
    end
  end

  describe '.total_moves' do
    let(:current_grid) { ['X', 'X', nil, 'X', nil, nil, nil, nil] }

    it 'returns total moves' do
      expect(subject.total_moves).to eq(3)
    end
  end
end
# rubocop:enable Metrics/BlockLength
