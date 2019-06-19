class CommentsController < ApplicationController
before_action :authenticate_user!
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.create(params[:comment].permit(:message))
    @comment.user_id = current_user.id
    @comment.article_id = @article.id
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
  	@article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:message, :article_id, :user_id)
    end

end
