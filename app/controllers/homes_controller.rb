class HomesController < ApplicationController
  def top
    @genre = Genre
    @genres = Genre.all
  end

  def about
  end
end
