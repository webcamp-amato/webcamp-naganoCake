class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    render 'cart_items/index'
  end

  def update
    @cart_item = current_customer.cart_items.find(cart_item_params)
    @cart_item.update
    render request.referer
  end

  def destroy
    @cart_item = current_customer.cart_items.find_by(params[:id])
    @cart_item.destroy
    render request.referer
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy
  end


  private

    def cart_item_params
      params.require(:cart_item).permit(:customer, :item_id, :count)
    end
end
