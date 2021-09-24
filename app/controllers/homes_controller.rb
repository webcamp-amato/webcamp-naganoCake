# frozen_string_literal: true

class HomesController < ApplicationController
  def top
    @items = Item.all.page(params[:page]).reverse_order.per(6)
    @genres = Genre.all
  end

  def about; end
end
