class HomesController < ApplicationController
  def top
    @genre = Genre
    @genres = Genre.all
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end
end
