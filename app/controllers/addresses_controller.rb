class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :show, :destroy]
  
  def index
    @addresses = current_user.addresses.all
  end

  def new
    @address = current_user.addresses.new
  end

  def create
    @address = current_user.addresses.new(address_params)
    if @address.save
      redirect_to addresses_path, notice: 'Address has been created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to addresses_path, notice: 'address has been updated successfully'
    else
      render :edit
    end
  end

  def destroy
    if @address.destroy
      redirect_to addresses_path, notice: 'address has been deleted successfully'
    end
  end

  def set_default
    address = Address.find(params[:id])
    current_user.addresses.update_all(default: false)
    address.update(default: true)
    redirect_to addresses_path, notice: 'Address is now a default address'
  end
  
  private
    def address_params
      params.require(:address).permit(:name, :email, :city, :state, :country, :pincode, :street)
    end

    def set_address
      @address = Address.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
      redirect_to addresses_path, notice: error
    end
end
