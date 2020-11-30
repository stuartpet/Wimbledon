# frozen_string_literal: true

require 'tennis_match'
require 'spec_helper'

RSpec.describe TennisMatch do

  subject { described_class.new(player_1: player_1, player_2: player_2, p1_score: p1_score, p2_score: p2_score) }

  let(:player_1) { 'Nadal' }
  let(:player_2) { 'Rafa' }
  let(:p1_score) { 0 }
  let(:p2_score) { 0 }

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
      expect { subject.player_1_serve }.to output.to_stdout
    end
  end

  context 'when a player moves in the wrong direction to the shot' do
    let(:p1_move) { 'left' }
    let(:p2_shot) { 'right' }

    it 'adds the correct points value to that players score' do
      expect { subject.player_1_shot(p2_shot) }.to change { subject.p2_score }.by(15)
    end
  end

  context 'when a player moves in the right direction as a shot' do
    let(:p1_move) { 'right' }
    let(:p2_shot) { 'right' }

    it 'does not add any points to the players score' do
      expect { subject.player_1_shot(p2_shot) }.not_to(change { subject.p1_score })
    end
  end


  context 'when a player has 30 points and scores another point' do
    let(:p1_score) { 30 }

    it 'increase the score by 10' do
      expect { subject.p1_score_keeper }.to change { subject.p1_score }.by(10)
    end
  end

  context 'when a player has 40 points and wins the next point' do
    let(:p1_score) { 40 }

    it 'prints a message to inform the player they have won' do
      expect { subject.p1_score_keeper }.to output("Congratulations #{player_1} you won the game\n").to_stdout
    end
  end

end
