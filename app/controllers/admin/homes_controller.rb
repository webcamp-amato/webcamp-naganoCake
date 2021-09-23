class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    if params[:order_waiting_value]
      @orders = Order.where(status: "入金待ち").order(created_at: "DESC").page(params[:page]).per(10)
    elsif params[:order_preparing_value]
      @orders = Order.where(status: "入金確認").order(created_at: "DESC").page(params[:page]).per(10)
    elsif params[:order_making_value]
      @orders = Order.where(status: "制作中").order(created_at: "DESC").page(params[:page]).per(10)
    elsif params[:order_sending_value]
      @orders = Order.where(status: "発送準備中").order(created_at: "DESC").page(params[:page]).per(10)
    elsif params[:order_complete_value]
      @orders = Order.where(status: "発送済み").order(created_at: "DESC").page(params[:page]).per(10)
    elsif params[:order_items_stopping_value]
      @items = OrderItem.where(status: "着手不可")
      @orders = Array.new
      @items.each do |item|
        @orders.push(item.order)
      end
      @orders = @orders.uniq
      @orders = Kaminari.paginate_array(@orders).page(params[:page]).per(10)
    elsif params[:order_items_preparing_value]
      @items = OrderItem.where(status: "制作待ち")
      @orders = Array.new
      @items.each do |item|
        @orders.push(item.order)
      end
      @orders = Kaminari.paginate_array(@orders).page(params[:page]).per(10)
    elsif params[:order_items_making_value]
      @items = OrderItem.where(status: "制作中")
      @orders = Array.new
      @items.each do |item|
        @orders.push(item.order)
      end
      @orders = Kaminari.paginate_array(@orders).page(params[:page]).per(10)
    elsif params[:order_items_complete_value]
      @items = OrderItem.where(status: "製作完了")
      @orders = Array.new
      @items.each do |item|
        @orders.push(item.order)
      end
      @orders = Kaminari.paginate_array(@orders).page(params[:page]).per(10)
    else
      @orders = Order.all.order(created_at: "DESC").page(params[:page]).per(8)
    end
  end
end
