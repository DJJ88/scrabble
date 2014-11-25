class Scrabble

  $TABLE = {
    "A"=>1, "B"=>3, "C"=>3, "D"=>2,
    "E"=>1, "F"=>4, "G"=>2, "H"=>4,
    "I"=>1, "J"=>8, "K"=>5, "L"=>1,
    "M"=>3, "N"=>1, "O"=>1, "P"=>3,
    "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
    "U"=>1, "V"=>4, "W"=>4, "X"=>8,
    "Y"=>4, "Z"=>10
  }

  def self.score(word)

    if word_nil_or_empty?(word)
      0
    elsif word_one_character?(word)
      $TABLE[word.upcase]
    else
      score_word(word)
    end
  end

  def self.highest_score_from(words)
    words.sort_by { |word| score(word) }.last
  end

  def self.word_nil_or_empty?(word)
    word.nil? || word.empty?
  end

  def self.word_one_character?(word)
    word.size == 1
  end

  def self.score_word(word)
    word.upcase.split('').map { |letter| $TABLE[letter] }.reduce(:+)
  end

end

puts Scrabble.highest_score_from(['hello', 'word', 'sound'])
