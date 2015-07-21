class QuestionGrader
  # include ActiveModel::Model
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
    "(correct?: #{grade}, user_id: #{soul.id}, question_id: #{query.id},
      response: '#{selection}')"
  end
end
