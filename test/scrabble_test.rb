gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'

class ScrabbleTest < Minitest::Test


  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.score("a")
    assert_equal 4, Scrabble.score("f")
  end

  def test_it_can_score_a_word
    assert_equal 8, Scrabble.score('hello')
  end

  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.score('')
  end

  def test_nil_scores_zero
    assert_equal 0, Scrabble.score(nil)
  end

  def test_highest_score_from
    assert_equal 'home', Scrabble.highest_score_from(['home', 'word', 'hello', 'sound'])
  end

  def test_fewer_tiles_better
      assert_equal 'word', Scrabble.highest_score_from(['hello', 'word', 'sound'])
  end




end
