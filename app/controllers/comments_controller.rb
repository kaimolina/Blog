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
end