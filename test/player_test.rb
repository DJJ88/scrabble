gem 'minitest'
require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest < Minitest::Test
  def test_it_has_a_name
    player = Player.new('Alex')
    assert_equal 'Alex', player.name
  end

  def test_it_records_words_played
    player = Player.new('Alex')
    assert_equal [], player.plays
  end

  def test_it_records_a_total_score
    player = Player.new('Alex')
    assert_equal 0, player.total_score
  end

  def test_it_records_a_play
    player = Player.new('Alex')
    player.play('hello')
    assert player.plays.include?('hello')
  end

  def test_a_play_is_factored_into_score
    player = Player.new('Alex')
    player.play('hello')
    assert_equal 8, player.total_score
  end

  def test_a_player_wins_with_a_score_of_100
    # Create a player
    player = Player.new('Alex')
    # Play 'hello' 12 times
    12.times { player.play('hello') }
    # Query .won? which should return false
    refute player.won?
    # Play 'hello' again
    player.play('hello')
    # Query .won? which should return true
    assert player.won?
  end

  def test_a_player_can_no_longer_play_once_they_have_won
    # Create a player
    player = Player.new('Alex')
    # Play 'hello' 13 times
    13.times { player.play('hello')}
    # Play 'hi' and check that it returns false
    refute player.play('hi')
    # Query player.plays and make sure 'hi' is NOT there
    refute player.plays.include?('hi')
  end

  def test_it_records_the_highest_scoring_word_and_score
    # Create a player
    player = Player.new('Alex')
    # Play 'hi'
    player.play('hi')
    # Play 'hello'
    player.play('hello')
    # Play 'me'
    player.play('me')
    # Check that `.highest_scoring_word` returns 'hello'
    assert_equal 'hello', player.highest_scoring_word
    # Check that `.highest_word_score` return 8
    assert_equal 8, player.highest_word_score
  end
end
