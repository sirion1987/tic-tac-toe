# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe TicTacToe::Game do
  subject { described_class.new(grid: current_grid) }

  let(:current_grid) { nil }
  let(:input) { '4' }

  before do
    allow($stdout).to receive(:write) { nil }
    allow($stdout).to receive(:puts) { nil }
    allow_any_instance_of(Kernel).to receive(:gets) { input }
  end

  it 'updates status to ok' do
    expect { subject.play }.not_to change(subject, :status)
  end

  it 'change player' do
    expect { subject.play }.to change(subject, :current_player)
  end

  describe 'with a one move to win' do
    let(:current_grid) { ['X', 'X', nil, 'X', 'O', 'O', nil, 'O', nil] }
    let(:input) { '7' }

    it 'updates status to finished' do
      expect { subject.play }.to change(subject, :status).to(:finished)
    end
  end

  describe 'with a stalled game' do
    let(:current_grid) { ['O', nil, 'X', 'X', 'X', 'O', 'O', 'O', 'X'] }
    let(:input) { '2' }

    it 'updates status to stalled' do
      expect { subject.play }.to change(subject, :status).to(:stalled)
    end
  end
end
# rubocop:enable Metrics/BlockLength
