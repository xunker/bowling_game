require_relative 'test_helper'
require './game'

class BowlingGameTest < MiniTest::Unit::TestCase
  def setup
    @game = Game.new
  end

  def test_can_create_game
    assert(@game.class == Game)
  end

  def test_can_roll_a_ball
    assert(@game.respond_to? :roll)
  end

  def test_can_check_score
    assert(@game.respond_to? :score)
  end


end