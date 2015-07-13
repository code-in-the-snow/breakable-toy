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
    it "stores four possible answers" do
      expect(q.option_a).to eq "apple"
      expect(q.option_b).to eq "banana"
      expect(q.option_c).to eq "coconut"
      expect(q.option_d).to eq "date"
    end
  end
end
