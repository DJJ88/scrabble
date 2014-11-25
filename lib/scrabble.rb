class Scrabble

  def self.score(word)
    table = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
    if word == nil || word.empty?
      0
    elsif word.size == 1
      table[word.upcase]
    else
      word.upcase.split('').map { |letter| table[letter] }.reduce(:+)
    end
  end

  def self.highest_score_from(words)
    words.map { |word| [word, score(word)] }.max_by { |entry| entry[1]}[0]
  end

end


puts Scrabble.highest_score_from(['hello', 'word', 'sound'])
