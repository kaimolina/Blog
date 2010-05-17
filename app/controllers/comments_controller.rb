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
      flash[:notice] = "Comment was successfuly posted."
      render :partial => 'comments', :locals => {:comment => @comment} unless @comment.new_record?
    else
      flash[:notice] = "Failed to post comment."
      render :partial => 'error', :locals => {:comment => @comment, :article => @article}, :status => 444
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete_by_author(params[:author_id])
    redirect_to article_comments_path(@comment.article_id)
  end
end
