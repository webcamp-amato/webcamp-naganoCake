class SearchesController < ApplicationController
  def word
    @value = params["search"]["value"]
    @items = Item.search_for(@value).page(params[:id]).per(8)
    @genres = Genre.all
  end

  def genre
    @genre = Genre.find(params[:id])
    @items = Item.where(genre_id: @genre.id).page(params[:id]).offset(0).per(8)
    @genres = Genre.all
  end
end
