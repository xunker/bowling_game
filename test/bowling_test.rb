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

  def test_score_is_zero_after_all_gutter_balls
    (1..20).each do |r|
      @game.roll(0)
    end
    assert_equal(0, @game.score, "bowling score wrong for all gutter balls")
  end

  def test_score_is_20_after_all_ones
    (1..20).each do |r|
      @game.roll(1)
    end
    assert_equal(20, @game.score, "bowling score wrong for all ones")
  end

  def test_score_is_20_after_rolling_extra_frames
    (1..23).each do |r|
      @game.roll(1)
    end
    assert_equal(20, @game.score, "bowling score wrong for all ones")
  end

  def test_score_is_correct_for_all_no_special_rolls
    (1..4).each do |pins|
      @game.reset
      (1..20).each do |r|
        @game.roll(pins)
      end
      assert_equal(pins * 20, @game.score, "bowling score wrong for all pin counts up to 4. pins = #{pins}")
    end
  end

  def test_simple_rolls_populate_correctly
    3.times do |v|
      @game.roll(v)
    end
    assert_equal(0, @game.frames[0][0], "expected roll 1 to be 0")
    assert_equal(1, @game.frames[0][1], "expected roll 2 to be 1")
    assert_equal(2, @game.frames[1][0], "expected roll 3 to be 2")
  end

  def test_spare_in_frame_one_gutter_frame_two
    2.times do |i|
      @game.roll(5)
    end

    2.upto(10) do |i|
      2.times do
        @game.roll(0)
      end
    end
    assert_equal(10, @game.score, "bowling score wrong for spare in first frame and all gutters after")
  end

  def test_spare_in_frame_one_ones_in_all_other_frames
    @game.roll(5)
    @game.roll(5)
    (1..9).each do |roll|
      @game.roll(1)
      @game.roll(1)
    end
    assert_equal(29, @game.score, "bowling score wrong for spare in first frame and all ones after")
  end

  def test_spare_in_last_frame_gives_three_balls
    (1..9).each do |roll|
      @game.roll(1)
      @game.roll(1)
    end
    @game.roll(5)
    @game.roll(5)
    @game.roll(5)
    assert_equal(3, @game.frames.last.length, "last frame should have 3 balls if first two are a spare")
  end

  def test_strike_in_frame_one_ones_in_all_other_frames
    @game.roll(10)
    (1..9).each do |roll|
      @game.roll(1)
      @game.roll(1)
    end
    assert_equal(30, @game.score, "bowling score wrong for strike in first frame and all ones after")
  end

  def test_all_strikes
    (1..12).each do |roll|
      @game.roll(10)
    end
    assert_equal(300, @game.score, "bowling score wrong for all strikes")
  end

  def test_all_spares_followed_by_gutter
    (1..20).each do |roll|
      @game.roll(5)
    end
    @game.roll(0)
    assert_equal(145, @game.score, "bowling score wrong for all spares and gutter ball")
  end

  def test_all_spares_followed_by_strike
    (1..20).each do |roll|
      @game.roll(5)
    end
    @game.roll(10)
    assert_equal(155, @game.score, "bowling score wrong for all spares and a strike")
  end

  def test_all_spares_followed_by_a_four_and_a_five
    (1..19).each do |roll|
      @game.roll(5)
    end
    @game.roll(4)
    @game.roll(5)  # NOP
    assert_equal(144, @game.score, "bowling score wrong for all spares and 4 followed by a 5 that should be ingnored")
  end

  def test_all_spares_followed_by_three_strikes
    (1..18).each do |roll|
      @game.roll(5)
    end
    @game.roll(10)
    @game.roll(10)
    @game.roll(10)
    assert_equal(170, @game.score, "bowling score wrong for all spares and three strikes")
  end

  def test_half_spares_followed_by_all_strikes
    (1..5).each do |roll|
      @game.roll(5)
      @game.roll(5)
    end
    (1..5).each do |roll|
      @game.roll(10)
      @game.roll(10)
    end
    @game.roll(10)
    assert_equal(230, @game.score, "bowling score wrong half spares and all strikes")
  end
  
  def test_sample_scores_add_up
    @game.roll(1)
    @game.roll(4)
    @game.roll(4)
    @game.roll(5)
    @game.roll(6)
    @game.roll(4)
    @game.roll(5)
    @game.roll(5)
    @game.roll(10)
    @game.roll(0)
    @game.roll(1)
    @game.roll(7)
    @game.roll(3)
    @game.roll(6)
    @game.roll(4)
    @game.roll(10)
    @game.roll(2)
    @game.roll(8)
    @game.roll(6)
    assert_equal(133, @game.score, "bowling score wrong for sample values") 
  end
end