# frozen_string_literal: true
class TennisMatch

  require 'pry'

  attr_reader :player_1, :player_2, :p1_score, :p2_score

  def initialize(player_1: '', player_2: '', p1_score:, p2_score:)
    @player_1 = player_1
    @player_2 = player_2
    @p1_score = p1_score
    @p2_score = p2_score
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
    player_1_serve
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

  def player_1_serve
    puts "#{player_1} please serve using left, right or middle"
    p1_shot = gets.chomp
    player_2_shot(p1_shot)
  end

  def player_1_shot(p2_shot)
    puts "#{player_1} please move player using left, right or middle"
    p1_move = gets.chomp
    puts "#{player_1} please return shot using left, right or middle"
    p1_shot = gets.chomp
    player_1_shot_calculation(p1_shot, p1_move, p2_shot)
  end

  def player_2_shot(p1_shot)
    puts "#{player_2} please move player using left, right or middle"
    p2_move = gets.chomp
    puts "#{player_2} please return shot using left, right or middle"
    p2_shot = gets.chomp
    player_2_shot_calculation(p2_shot, p2_move, p1_shot)
  end

  def player_2_shot_calculation(p2_shot, p2_move, p1_shot)
    if p2_move == p1_shot
      player_1_shot(p2_shot)
    elsif p2_move != p1_shot
      p1_score_keeper
    end
  end

  def player_1_shot_calculation(p1_shot, p1_move, p2_shot)
    if p1_move == p2_shot
      player_2_shot(p1_shot)
    elsif p1_move != p2_shot
      p2_score_keeper
    end
  end

  def p1_score_keeper
    if @p1_score >= 40
      puts "Congratulations #{player_1} you won the game"
    elsif @p1_score == 30
      @p1_score += 10
      puts "#{player_2} you missed, #{player_1}'s score is now '#{p1_score}"
    else
      @p1_score += 15
      puts "#{player_2} you missed, #{player_1}'s score is now '#{p1_score}"
    end
  end

  def p2_score_keeper
    if @p2_score >= 40
      puts "Congratulations #{player_2} you won the game"
    elsif @p2_score == 30
      @p2_score += 10
      puts "#{player_1} you missed, #{player_2}'s score is now '#{p2_score}"
    else
      @p2_score += 15
      puts "#{player_1} you missed, #{player_2}'s score is now '#{p2_score}"
    end
  end
end
