# frozen_string_literal: true

class SearchesController < ApplicationController
  def word
    @value = params['search']['value']
    @items = Item.search_for(@value).page(params[:page]).per(8)
    @genres = Genre.all
  end

  def genre
    @genre = Genre.find(params[:id])
    @search_items = Item.where(genre_id: @genre.id)
    @items = @search_items.page(params[:page]).per(8)
    @genres = Genre.all
  end
end
