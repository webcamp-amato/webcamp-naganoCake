class SearchesController < ApplicationController
  def word
  end

  def genre
    @genre = Genre.find(params[:id])
    @items = Item.where(genre_id: @genre.id).page(params[:id]).offset(0).per(8)
    @genres = Genre.all
  end
end
