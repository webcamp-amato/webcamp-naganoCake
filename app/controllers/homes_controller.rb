class HomesController < ApplicationController
  def top
    @items = Item.all.page(params[:page]).reverse_order.per(4)
    @genres = Genre.all
  end

  def about
  end

end
