# frozen_string_literal: true

RSpec.describe 'tennis_match' do

  subject { described_class.new }

  context 'when a player opens the game' do
    it 'puts a greeting' do
      expect(subject).to output(/Hi, Welcome to wimbledon, please add your player name/).to_stdout
    end
  end

end