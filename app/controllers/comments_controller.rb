class CommentsController < ApplicationController
  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build
    render :template => "articles/latest"
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Comment was successfully posted."
      redirect_to article_path(@article)
    else
      flash[:notice] = "Fail to post comment."
      render :template => "articles/latest"
    end

  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete_by_author(params[:author_id])
    redirect_to article_comments_path(@comment.article_id)
  end
end
