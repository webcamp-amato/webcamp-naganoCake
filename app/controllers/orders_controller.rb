class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
  end

  def show
  end


  def new
    @customer = current_customer
  end

  def confirm
    @order = Order.new
    @customer = current_customer
    @order.customer_id = @customer.id
    @new_place = DeliveryPlace.new
    @new_place.customer_id = @customer.id
    @order.payment_method = params[:payment_method].to_i
    @order.postage = 800
    @cart_items = @customer.cart_items
    @sum = 0

    if params[:place_option] == "0"
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      full_name = @customer.last_name + @customer.first_name
      @order.addressee = full_name

    elsif params[:place_option] == "1"
      @sta = params[:order_place]
      @order_place = DeliveryPlace.find(@sta)
      @order.postcode = @order_place.postcode
      @order.address = @order_place.address
      @order.addressee = @order_place.addressee

    elsif params[:place_option] == "2"
      @order.postcode = params[:postcode]
      @order.address = params[:address]
      @order.addressee = params[:addressee]
    end
    # binding.pry

  end

  def create
      @order = Order.new(order_params)
      @order.save
      if @order.invalid?
        render :new
      end
      
      @cart_items = @customer.
      redirect_to orders_complete_path
  end

  def complete
  end



  private
    def order_params
      params.require(:order).permit(:total_price, :payment_method, :postage, :place_option, :order_place, :postcode, :address, :addressee)
    end
end
