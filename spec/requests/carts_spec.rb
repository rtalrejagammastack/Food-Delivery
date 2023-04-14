require 'rails_helper'

RSpec.describe "Carts", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get :show
      expect(response).to render_template(:show)
    end

    it 'assigns the current user cart to @cart' do
      get :show
      expect(assigns(:cart)).to eq(user.cart)
    end
  end

  describe 'POST #add_to_cart' do
    let(:food) { create(:food) }

    context 'when the food exists' do
      it 'adds the food to the cart' do
        expect {
          post :add_to_cart, params: { food_id: food.id }
        }.to change(user.cart.cart_items, :count).by(1)
      end

      it 'redirects to the cart page' do
        post :add_to_cart, params: { food_id: food.id }
        expect(response).to redirect_to(cart_path)
      end
    end

    context 'when the food does not exist' do
      it 'redirects to the root page' do
        post :add_to_cart, params: { food_id: 0 }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'DELETE #remove_from_cart' do
    let(:food) { create(:food) }

    before do
      user.cart.cart_items.create(food: food, quantity: 1)
    end

    it 'removes the food from the cart' do
      expect {
        delete :remove_from_cart, params: { food_id: food.id }
      }.to change(user.cart.cart_items, :count).by(-1)
    end

    it 'redirects to the cart page' do
      delete :remove_from_cart, params: { food_id: food.id }
      expect(response).to redirect_to(cart_path)
    end
  end
end
