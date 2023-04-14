require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:user) { FactoryBot.create(:user) }
  subject { FactoryBot.create(:cart, user: user) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:cart_items).dependent(:destroy) }
    it { should have_many(:foods).through(:cart_items) }
  end

  describe "#subtotal" do
    it "calculates the correct subtotal" do
      food1 = FactoryBot.create(:food, price: 10.0)
      food2 = FactoryBot.create(:food, price: 15.0)
      cart_item1 = FactoryBot.create(:cart_item, food: food1, cart: subject, quantity: 2)
      cart_item2 = FactoryBot.create(:cart_item, food: food2, cart: subject, quantity: 1)
      expect(subject.subtotal).to eq(35.0)
    end
  end

  describe "#total" do
    it "calculates the correct total" do
      allow(subject).to receive(:subtotal).and_return(35.0)
      expect(subject.total).to eq(40.0)
    end
  end
end
