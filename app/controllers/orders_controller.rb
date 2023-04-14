class OrdersController < ApplicationController
    before_action :set_order, only: [:edit, :update, :show, :destroy]
    
    def index
      @orders = current_user.orders.all
    end

    def new
      @order = current_user.orders.new
    end

    def create

      @order = current_user.orders.(order_params)
        
      current_user.cart.cart_items.each do |cart_item|
        order_item = @order.order_items.build(food: cart_item.food, quantity: cart_item.quantity, price: cart_item.food.price, user_id: current_user.id)
        order_item.save!
      end

      if @order.save!
        SendConfirmationJob.perform_later(@order, current_user)

        current_user.cart.cart_items.destroy_all
        redirect_to order_path(@order, @order_items), notice: 'order has been created successfully'
      else
        render :new
      end
    end

    def edit
        
    end

    def update
       
      if @order.update(order_params)
        redirect_to orders_path, notice: 'order has been updated successfully'
      else
        render :edit
      end

    end

    def show
      @order = Order.find_by_id(params[:id])
    end

    def destroy
        if @order.destroy
            redirect_to orders_path, notice: 'address has been deleted successfully'
        end
    end
    
    private
        def order_params
            params.permit(:total_amount, :status) # permit! -> save all
        end

        def set_order
            @order = Order.find(params[:id])
        rescue ActiveRecord::RecordNotFound => error
            redirect_to orders_path, notice: error

        end
end
