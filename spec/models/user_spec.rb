require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should allow_value('email@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
  end

  describe "associations" do
    it { should have_one(:cart) }
    it { should have_many(:orders) }
    it { should have_many(:addresses) }
  end

  describe "callbacks" do
    it "downcases email before saving" do
      user = FactoryBot.create(:user, email: 'EMAIL@example.com')
      expect(user.email).to eq('email@example.com')
    end

    it "creates a cart after creating a user" do
      user = FactoryBot.create(:user)
      expect(user.cart).to be_present
    end
  end
end
