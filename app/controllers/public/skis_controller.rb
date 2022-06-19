class Public::SkisController < ApplicationController
  def index
    @skis = Ski.all
    #if 検索データが送られてきた場合
    @genre = Genre.where(is_registration: true)
    #@gemres = Genre.where(name: paramsでおくられてくるデータ)

  end

  def new
    @ski = Ski.new
    @genre = Genre.where(is_registration: true)
  end

  def create
    @ski = Ski.new(ski_params)
    @ski.user_id = current_user.id
    @ski.save
    redirect_to public_ski_path(@ski.id)
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
    permit(:name)
  end


end
