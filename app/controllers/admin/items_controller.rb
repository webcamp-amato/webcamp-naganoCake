class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    render :show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(item_params)
    @item.update
  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :description, :price, :is_active, :image)
    end
end
