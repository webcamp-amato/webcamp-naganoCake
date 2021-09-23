class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @allorder = Order.all
    if params[:order_waiting_value]
      @orders = Order.where(status: "入金待ち").order(created_at: "DESC").page(params[:page]).per(8)
    elsif params[:order_preparing_value]
      @orders = Order.where(status: "入金確認").order(created_at: "DESC").page(params[:page]).per(8)
    elsif params[:order_making_value]
      @orders = Order.where(status: "制作中").order(created_at: "DESC").page(params[:page]).per(8)
    elsif params[:order_sending_value]
      @orders = Order.where(status: "発送準備中").order(created_at: "DESC").page(params[:page]).per(8)
    elsif params[:order_complete_value]
      @orders = Order.where(status: "発送済み").order(created_at: "DESC").page(params[:page]).per(8)
    elsif params[:order_items_stopping_value]
      @allorder.each do |order|
        if order.order_items.where(status: "着手不可").any?
          @orders << order
        end
      end
    elsif params[:order_items_preparing_value]
      @orders = @allorder.order_items.where(status: "製作待ち").order(created_at: "DESC").page(params[:page]).per(8)
    elsif params[:order_items_making_value]
      @orders = @allorder.order_items.where(status: "製作中").order(created_at: "DESC").page(params[:page]).per(8)
    elsif params[:order_items_complete_value]
      @orders = @allorder.order_items.where(status: "製作完了").order(created_at: "DESC").page(params[:page]).per(8)
    else
      @orders = Order.all.order(created_at: "DESC").page(params[:page]).per(8)
    end
  end
end
