# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @sum = 0
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @count = @cart_item.count + cart_item.count
      cart_item.update(count: @count)
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
    redirect_to cart_items_url
  end

  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_url
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_url
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :count)
  end
end
