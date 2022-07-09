class Public::SkisController < ApplicationController
  def index
    @genre = Genre.where(is_registration: true)
    @search_params = genre_search_params
    @skis = Ski.search(@search_params).includes(:genre)

  end

  def new
    @ski = Ski.new
    @genre = Genre.where(is_registration: true)
  end

  def create
    @ski = Ski.new(ski_params)
    @ski.user_id = current_user.id
    if @ski.save
      redirect_to public_ski_path(@ski.id)
    else
      @genre = Genre.where(is_registration: true)
      render :new
    end
  end

  def show
    @ski = Ski.find(params[:id])
    @genre = @ski.genre
    @ski_comment = SkiComment.new
  end

  def edit
    @ski = Ski.find(params[:id])
    @genres = Genre.all
  end

  def update
    @ski = Ski.find(params[:id])
    @ski.update(ski_params)
    redirect_to public_ski_path(@ski.id)
  end

  def destroy
    @ski = Ski.find(params[:id])
    @ski.destroy
    redirect_to public_skis_path
  end

  private

  def ski_params
    params.require(:ski).permit(:image, :title, :genre_id, :body)
  end

  def genre_search_params
    params.fetch(:search, {}).permit(:genre_id)
  end


end
