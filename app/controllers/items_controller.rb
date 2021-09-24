# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all

    @cart_item = current_customer.cart_items.new if customer_signed_in?
  end
end
