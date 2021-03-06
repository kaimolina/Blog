class ArticlesController < ApplicationController
  before_filter :require_author, :except => [:latest, :show]
  before_filter :find_article, :only => [:show, :print, :edit, :update, :destroy]
  def latest
    @article = Article.latest
    unless @article.nil?
      @comment = Comment.new(:article_id => @article.id)
    end
  end
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end
  # GET /articles/1
  # GET /articles/1.xml
  def show
    render :action => "latest"
  end
  def print
    render :action => "print", :layout => "print"
  end
  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end
  # GET /articles/1/edit
  def edit
  end
  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])
    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        format.html { redirect_to(@article) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end
  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to(@article) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end
  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
  private
  def find_article
    @article = Article.find(params[:id])
  end
end