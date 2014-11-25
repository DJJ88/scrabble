class Player
  attr_reader   :name,
                :plays,
                :total_score

  def initialize(name)
    @name         = name
    @plays        = []
    @total_score  = 0
    @score = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def play(word)
    if won?
      false
    else
      @plays << word
      word = word.upcase.split('')
      @total_score += word.map { |letter| @score[letter] }.reduce(:+)
    end
  end

  def won?
    total_score > 100
  end

  def highest_scoring_word
    scores = @plays.map do |word|
      [word, calculate_score(word)]
    end
    scores.max_by do |entry|
      entry[1]
    end[0]
  end

  def highest_word_score
    scores = @plays.map do |word|
      [word, calculate_score(word)]
    end
    scores.max_by do |entry|
      entry[1]
    end[1]
  end

  def calculate_score(word)
    word.upcase.split('').map { |letter| @score[letter] }.reduce(:+)
  end

end
