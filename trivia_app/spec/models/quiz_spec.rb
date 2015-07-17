require 'rails_helper'

RSpec.describe Quiz, type: :model do
  let(:z) { FactoryGirl.create(:quiz) }

  describe '#initialize' do
    it "returns number of wrong answers" do
      expect(z.count_wrong_answers).to eq(1)
    end
  end
end
