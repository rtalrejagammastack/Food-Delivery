class CartsController < ApplicationController
    before_action :authenticate_user!

    def show
        @cart_items = current_user.cart.cart_items
    end

    def create
        @cart = current_user.cart
        # if @cart.blank?
        #     @cart = Cart.create(user:current_user)
        # end
        # byebug
        food = Food.find(params[:food_id])
        cart_item = @cart.cart_items.where(food: food).first
        if cart_item
          cart_item.quantity += 1
          # cart_item.save!
        else
          cart_item = @cart.cart_items.build(food: food, quantity:1)
          # cart_item.quantity = 1
        end
        
        if cart_item.save
          flash[:alert] = "Food added to cart"
        else
          flash[:error] = "Unable to add food to cart"
        end
        redirect_to cart_path(current_user.cart)
    end

    def update
        
      cart_item = current_user.cart.cart_items.find_by_id(params[:id])
      cart_item.update(quantity: (params[:cart_item][:quantity].to_f))
      redirect_to cart_path
    end
      
     
    
end
