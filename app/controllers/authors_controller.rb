class AuthorsController < ApplicationController
  before_filter :require_author, :except => [:new, :create]
  before_filter :find_author, :only => [:show, :edit, :update, :destroy]
  def index
    @authors = Author.all
  end
  def show
  end
  def new
    @author = Author.new
  end
  def edit
  end
  def create
    @author = Author.new(params[:author])
    if @author.save
      redirect_to @author 
    else
      render :action => 'new'
    end
  end
  def destroy
    @author.destroy
    redirect_to(authors_url)
  end
  def update
    if @author.update_attributes(params[:author])
      redirect_to @author
    else
      render :action=> "edit"
    end
    #raise "test"
  end
  def find_author
    @author = Author.find(params[:id])
  end
end