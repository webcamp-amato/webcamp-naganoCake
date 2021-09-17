class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
    @sum = 0
    @customer = @order.customer
    
  end

  def update
  end
end
