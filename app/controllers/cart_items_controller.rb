class CartItemsController < ApplicationController

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy!
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.json { render :json => {:message => "success", :body => cart_item.id} }
    end
  end

  def increment_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: @cart_item.quantity += 1)
    redirect_to cart_path
  end
  
  def decrement_quantity
    @cart_item = CartItem.find(params[:id])
    if(@cart_item.quantity!=1)
      @cart_item.update(quantity: @cart_item.quantity -= 1)
      redirect_to cart_path
    else
      destroy
    end
  end      
end
