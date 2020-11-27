# frozen_string_literal: true

class TennisMatch
  attr_reader :player_1, :player_2, :p1_score, :p2_score

  def initialize(player_1: '', player_2: '')
    @player_1 = player_1
    @player_2 = player_2
    @p1_score = 0
    @p2_score = 0
  end

  def start_game
    puts 'Hi, Welcome to wimbledon, please add your player name'
    @player_1 = gets.chomp
    puts 'lets add player_2'
    @player_2 = gets.chomp
    ready
  end

  def ready
    puts "Hi #{player_1} and #{player_2}, get ready"
    # p1_serve
  end

  def rules
    puts <<~HEREDOC
      'these are the rules:
       In one game you may score: 0 (love), 15, 30 and 40 points,
        You win a game if you:
        . have 40 points and win the next ball
        . if deuce you must have a advantage of 2 points
        . if both players have 40 points then there is a deuce

       Deuce: in order to be a winner you should score two points twice in succession. Otherwise, the deuce still lasts'
    HEREDOC
  end

  def serve
    puts "#{player_1} please choose left, right or middle"
    p1_shot = gets.chomp
    puts "#{player_2} return with left, right or middle"
    p2_shot = gets.chomp
  end
end
