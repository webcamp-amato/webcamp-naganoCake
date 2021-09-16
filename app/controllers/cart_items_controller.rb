class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_items = current_customer.cart_items
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.count += params[:cart_item][:count].to_i
      @cart_item.save
      redirect_to cart_items_url(@cart_item.customer)
    elsif
      @cart_item.save
      redirect_to cart_items_url(@cart_item.customer)
    else
      redirect_to items_url
    end
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    render request.referer
  end

  def destroy
    @cart_item = current_customer.cart_items.find_by(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy
    redirect_to items_url
  end


  private

    def cart_item_params
      params.require(:cart_item).permit(:customer_id, :item_id, :count)
    end
end
