class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
  end

  def show
  end

  def create
    @customer = Customer.find(params[:customer_id])
    # 不要かも
    @cart_items = @customer.cart_items
    # 不要かも
    @order.payment_method = params[:order][:payment_method]
    
    if params[:order][:place_option] == "0"
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      full_name = @customer.last_name + @customer.first_name
      @order.addressee = full_name
    elsif params[:order][:place_option] == "1"
      @sta = params[:order][:order_address].to_i
      @order_address = DeliveryPlace.find(@sta)
      @order.postcode = @order_address.postcode
      @order.address = @order_address.address
      @order.addressee = @order_address.addressee
    elsif params[:order][:place_option] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.addressee = params[:order][:addressee]
    end
    
  end
  
  def new
    @customer = Customer.find(params[:customer_id])
    @order = Order.new
    @order.customer_id = @customer.id
    @new_place = DeliveryPlace.new
    @new_place.customer_id = @customer.id
    
  end

  def confirm
  end

  def complete
  end
  

  private
    def order_params
      params.require(:order).permit(:payment_method, :postcode, :address, :addressee)
    end
end
