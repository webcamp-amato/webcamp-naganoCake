class HomesController < ApplicationController
  def top
    @items = Item.all.order(created_at: :asc)
  end

  def about
  end
end
