class CheckoutsController < ApplicationController
    

    def checkout
        # byebug
        @order = current_user.orders.build
        # current_user.cart.cart_items.each do |cart_item|
        #   @order.order_items.build(food: cart_item.food, quantity: cart_item.quantity, price: cart_item.food.price)
        # end
        # @order.total_amount = current_user.cart.total
        # if @order.save
        #   current_user.cart.cart_items.destroy_all
        #   redirect_to order_path(@order), notice: "Order placed successfully"
        # else
        #   redirect_to cart_path, alert: "Unable to place order"
        # end
    end

    # def checkout_items
    #     # debugger
    #     @order = current_user.build_order
    #     current_user.cart.cart_items.each do |cart_item|
    #       @order.order_items.build(food: cart_item.food, quantity: cart_item.quantity, price: cart_item.food.price)
    #     end
    #     @order.total = current_user.cart.total
    #     if @order.save!
    #       current_user.cart.cart_items.destroy_all
    #       redirect_to order_path(@order), notice: "Order placed successfully"
    #     else
    #       redirect_to cart_path, alert: "Unable to place order"
    #     end
    # end
    # def checkout_items
    #     @order = 
    # end

end

