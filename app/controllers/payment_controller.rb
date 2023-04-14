class PaymentController < ApplicationController
    def process_payment
        @cart = current_user.cart
        @order = current_user.cart.create_order(user_id: current_user.id, status: "Pending", restaurant_id:1)
        # @order = current_user.orders.find(params[:id])
        @amount = @order.total * 100 # convert to cents for Stripe
        customer = Stripe::Customer.create(
          email: current_user.email,
          source: params[:stripeToken]
        )
        charge = Stripe::Charge.create(
          customer: customer.id,
          amount: @amount,
          description: 'Food Delivery App Order',
          currency: 'usd'
        )
        @order.update(status: 'paid')
        redirect_to order_path(@order), notice: 'Payment processed successfully'
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to order_path(@order)
      end
end
