# require_relative "order_controller.rb"
class OrderItemsController < ApplicationController
    
    # def new
    #     @order_item = OrderItem.new    
    #     # user = User.find_by_id(params[:user_id])
    #     # @order_item = current_user.order_items.build(order_item_params)
    #     # # @order_item = Order.new(order_item_params)    
    #     # if @order_item.save
    #     #     redirect_to @order, notice: 'Employee has been created successfully'
    #     # else
    #     #     render :new
    #     # end      
    # end
    
    # # def create
    # #     # food_id = params[:food_id]
    # #     user = User.find_by_id(params[:user_id])
    # #     @order_item = current_user.order_items.build(order_item_params)
    # #     # @order_item = Order.new(order_item_params)    
    # #     if @order_item.save
    # #         redirect_to @order, notice: 'Employee has been created successfully'
    # #     else
    # #         render :new
    # #     end    
    # # end
    
    # private
    # def order_item_params
    #     # user_id = params[:user_id]
    #     params.require(:order_items).permit(:food_id, :quantity, :user_id)
    # end
end
