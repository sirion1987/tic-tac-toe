# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TicTacToe::Player do
  subject { described_class.new(type: type, symbol: symbol) }

  let(:symbol) { 'X' }

  describe '.do_move' do
    let(:type) { 'human' }

    before do
      allow_any_instance_of(Kernel).to receive(:gets) { '1' }
      allow($stdout).to receive(:puts) { nil }

      subject.do_move
    end

    it 'updates choose' do
      expect(subject.choose).to eq(1)
    end

    context 'with machine' do
      let(:type) { 'machine' }

      xit 'returns a message' do
        expect(subject.do_move).to eq('not still working ...')
      end
    end
  end
end
