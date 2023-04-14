require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:cart_item1) { FactoryBot.create(:cart_item) }
  let(:cart_item2) { FactoryBot.create(:cart_item) }
  subject { FactoryBot.create(:order, user: user, cart_items: [cart_item1, cart_item2]) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:order_items).dependent(:destroy) }
    it { should have_many(:cart_items).through(:order_items) }
  end

  describe "validations" do
    it { should define_enum_for(:status).with_values(pending: 0, inprogress: 1, complete: 2) }
  end

  describe "accepts_nested_attributes_for" do
    it { should accept_nested_attributes_for(:cart_items) }
  end
end
