class Public::SkiCommentsController < ApplicationController

  def create
    ski = Ski.find(params[:ski_id])
    comment = current_user.ski_comments.new(ski_comment_params)
    comment.ski_id = ski.id
    if comment.save
      redirect_to public_ski_path(ski)
    else
      @ski = ski
      @genre = @ski.genre
      @ski_comment = comment
      render template: "public/skis/show"
    end
  end

  def destroy
    SkiComment.find(params[:id]).destroy
    redirect_to public_ski_path(params[:ski_id])
  end

  private

  def ski_comment_params
    params.require(:ski_comment).permit(:comment)
  end

end
