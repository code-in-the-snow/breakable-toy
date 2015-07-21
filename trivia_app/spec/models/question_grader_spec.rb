require 'rails_helper'

RSpec.describe QuestionGrader, type: :model do
  let(:s) { FactoryGirl.build(:user) }
  let(:q) { FactoryGirl.build(:question) }

  describe '#grade' do
    context 'user is right' do
      it "calculates user grade" do
        expect(QuestionGrader.new(s, q, "coconut").grade).to be true
      end
    end

    context 'user is wrong' do
      it "calculates user grade" do
        expect(QuestionGrader.new(s, q, "kiwi").grade).to be false
      end
    end
  end

  describe '#attributes' do
    it 'returns attribute hash for new user_question' do
      s = FactoryGirl.build(:user)
      q = FactoryGirl.build(:question)
      g = QuestionGrader.new(s, q, "kiwi")
      expect(g.attributes).to eq("(correct?: #{false}, user_id: #{1}, question_id: #{1}, response: 'kiwi')")
    end
  end
end
