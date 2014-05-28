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

  def test_score_returns_an_fixnum
    assert(@game.score.class == Fixnum)
  end

  def test_after_1_roll_score_is_correct
    @game.roll(1) # [ [ 0 ] ]

    assert_equal(1, @game.score)
  end

  def test_score_after_spare_is_correct
    # first frame - spare
    @game.roll(5)
    @game.roll(5)

    # second frame
    @game.roll(1)
    @game.roll(1)

    assert_equal(13, @game.score)
  end

  def test_score_after_strike_is_correct
    # first frame - spare
    @game.roll(10) # 14

    # second frame 
    @game.roll(1) # 1
    @game.roll(1) # 1

    # third frame
    @game.roll(1) # 1
    @game.roll(1) # 1

    assert_equal(18, @game.score)
  end

  def test_score_after_all_strikes_in_last_frame_is_correct
    10.times do
      @game.roll(10)
    end

    @game.roll(10)
    @game.roll(10)

    assert_equal(300, @game.score)
  end
end