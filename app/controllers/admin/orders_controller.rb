class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
    @sum = 0
    @customer = @order.customer

  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_status_params)
    if @order.status == "入金確認"

      @order.order_items.each do |order_item|
        order_item.status = "製作待ち"
        order_item.save
      end
    end
    redirect_to request.referer
  end

  private
    def order_status_params
      params.require(:order).permit(:status)
    end
end
