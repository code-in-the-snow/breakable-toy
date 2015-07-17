require 'rails_helper'

RSpec.describe Question_set, type: :model do
  let(:q) { FactoryGirl.create(:question) }

  describe '#initialize' do
    it "returns 5 questions from Questions.all" do
      expect(q.answer).to eq "coconut"
    end

    it "shuffles questions from Questions.all" do
      expect(q.all_options).to include("apple")
      expect(q.all_options).to include("banana")
      expect(q.all_options).to include("coconut")
      expect(q.all_options).to include("date")
    end
  end
end
