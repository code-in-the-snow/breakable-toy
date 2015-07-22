class Quiz
  # include ActiveModel::Model
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def date_taken
    array[0].created_at.sstrftime("%D")
  end

  def right
    sum = 0
    array.each { |a| a.correct? ? sum += 1 : sum }
    sum
  end

  def percent_right
    right / array.size
  end
end
