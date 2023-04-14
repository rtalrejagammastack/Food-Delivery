require 'rails_helper'

RSpec.describe User, type: :model do
  context "when there are duplicate emails" do
    let(:user) {build :user}

    it "should be" do
      expect(user).to be_valid
    end
  end
  
end
