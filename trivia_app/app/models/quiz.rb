class Quiz
  include ActiveModel::Model
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def date_taken
    array[0].created_at.strftime("%D %H:%M")
  end

  def right
    sum = 0
    array.each { |a| a.correct? ? sum += 1 : sum }
    sum
  end

  def percent_right
    '%.1f' % [(right / 5.0) * 100]
  end
end
