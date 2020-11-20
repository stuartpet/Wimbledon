# frozen_string_literal: true

require 'tennis_match'

RSpec.describe TennisMatch do

  subject { described_class.new }

  context 'when a player opens the game' do
    it 'puts a greeting' do
      expect { subject.greeting }.to output("Hi, Welcome to wimbledon, please add your player name\n").to_stdout
    end
  end

  context 'when a player enters their name' do
    let(:name) {"Nadal"}
    it 'greets the player by name' do
      expect { subject.start }.to output("Hi #{name}, let's play!").to_stdout
    end
  end

end
