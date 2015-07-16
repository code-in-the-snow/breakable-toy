require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:q) { FactoryGirl.create(:question) }

  describe '#initialize' do
    it "stores the text of a question" do
      expect(q.body).to eq "Test Question"
    end
    it "stores the correct answer" do
      expect(q.answer).to eq "coconut"
    end
    it "stores three false answer choices" do
      expect(q.options[0]).to eq "apple"
      expect(q.options[1]).to eq "banana"
      expect(q.options[2]).to eq "date"
    end
  end
end
