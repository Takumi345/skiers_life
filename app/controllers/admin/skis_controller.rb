class Admin::SkisController < ApplicationController
  def index
    @skis = Ski.all
  end

  def show
    @ski = Ski.find(params[:id])
    @genre = @ski.genre
    @ski_comment = SkiComment.new
  end

  def destroy
    @ski = Ski.find(params[:id])
    @ski.destroy
    redirect_to admin_skis_path
  end
end
