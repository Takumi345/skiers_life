class Public::GenresController < ApplicationController
  def index
    @genres = Genre.where(is_registration: true)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to public_genre_path(@genre.id)
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to public_genre_path(@genre.id)
  end

  private

  def genre_params
    params.require(:genre).permit(:image, :name, :body)
  end

end
