class QuestionGrader
  attr_reader :soul, :query, :selection

  def initialize(soul, query, selection)
    @soul = soul
    @query = query
    @selection = selection
  end

  def grade
    if query.answer == selection
      true
    else
      false
    end
  end

  def attributes
    attrs = Hash.new
    attrs[:correct?] = grade
    attrs[:user_id] = soul.id
    attrs[:question_id] = query.id
    attrs[:response] = selection
    attrs
  end
end
