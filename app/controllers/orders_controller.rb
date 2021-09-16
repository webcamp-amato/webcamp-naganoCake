class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
  end

  def show
  end

  def create

      redirect_to customer_orders_complete_path
  end

  def new
    @customer = Customer.find(params[:customer_id])
  end

  def confirm
    @order = Order.new
    @customer = Customer.find(params[:customer_id])
    @order.customer_id = @customer.id
    @new_place = DeliveryPlace.new
    @new_place.customer_id = @customer.id
    @order.payment_method = params[:payment_method].to_i
    @order.postage = 800
    @cart_items = @customer.cart_items

    if params[:place_option] == "0"
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      full_name = @customer.last_name + @customer.first_name
      @order.addressee = full_name
      
    elsif params[:place_option] == "1"
      @sta = params[:address].to_i
      @order_place = DeliveryPlace.find(@sta)
      @order.postcode = @order_address.postcode
      @order.address = @order_address.address
      @order.addressee = @order_address.addressee
    elsif params[:order][:place_option] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.addressee = params[:order][:addressee]
    end
      binding.pry

  end

  def complete
  end


  private
    def order_params
      params.require(:order).permit(:payment_method, :place_option, :postcode, :address, :addressee)
    end
end
