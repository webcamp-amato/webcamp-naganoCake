class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
  end

  def show
  end

  def create
  end
  
  def new
    @customer = Customer.find(params[:id])
    @new_place = Delivery_places.new
    
  end

  def confirm
  end

  def complete
  end
  

  private
    def order_params
    end
end
