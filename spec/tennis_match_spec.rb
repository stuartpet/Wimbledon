# frozen_string_literal: true

require 'tennis_match'

RSpec.describe TennisMatch do

  subject { described_class.new(player_1: player_1) }

  let(:player_1) { 'Nadal' }
  let(:player_2) { 'Rafa' }

  context 'when a player opens the game' do
    it 'puts a greeting' do
      expect { subject.start_game }.to output.to_stdout
    end
  end

  context 'when players have entered their names' do
    it 'prints out a message' do
      expect { subject.ready }.to output.to_stdout
    end
  end

  context 'when a player starts a service game' do
    it 'it will ask them to choose left, right or middle' do
      expect { subject.serve }.to output.to_stdout
    end
  end
end
