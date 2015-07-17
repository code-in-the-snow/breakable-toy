require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:q) { FactoryGirl.create(:question) }

  describe '#initialize' do
    it "stores the correct answer" do
      expect(q.answer).to eq "coconut"
    end

    it "adds correct answer to options array" do
      expect(q.all_options).to include("apple")
      expect(q.all_options).to include("banana")
      expect(q.all_options).to include("coconut")
      expect(q.all_options).to include("date")
    end
  end
end
