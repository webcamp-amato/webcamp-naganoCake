# frozen_string_literal: true

class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(item_status_params)
    @order = @order_item.order
    if @order.order_items.where(status: '製作中').any?
      @order.status = '製作中'
      @order.save
    elsif @order.order_items.count == @order.order_items.where(status: '製作完了').count
      @order.status = '発送準備中'
      @order.save
    end

    redirect_to request.referer
  end

  private

  def item_status_params
    params.require(:order_item).permit(:status)
  end
end
