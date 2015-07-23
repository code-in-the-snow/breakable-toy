require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:q) { FactoryGirl.create(:question) }

  describe '#initialize' do
    it "stores the correct answer" do
      expect(q.answer).to eq "coconut"
    end
  end

  describe '#answers' do
    it "adds correct answer to options array" do
      expect(q.answers).to include("apple")
      expect(q.answers).to include("banana")
      expect(q.answers).to include("coconut")
      expect(q.answers).to include("date")
    end
  end

  describe '#next' do
    it 'does not repeat a question' do
    end
  end

end
