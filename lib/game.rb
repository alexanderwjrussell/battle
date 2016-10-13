require_relative 'player'

class Game

  attr_reader :player_1, :player_2, :players, :current_turn, :opponent

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
    @opponent = player_2
    @game_over = false
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(opponent)
    opponent.reduce_health
    game_over?
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def opponent_of(the_player)
    @opponent = @players.select{|player| player != the_player}.first
  end

  def game_over?
    @game_over = opponent.fubar?
  end

end
