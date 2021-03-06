class SessionsController < ApplicationController
  before_filter :require_no_author, :only => [:new, :create]
  before_filter :require_author, :only => [:logout, :destroy]
  def new
    @author_session = AuthorSession.new
  end
  def create
    @author_session = AuthorSession.new(params[:author_session])
    if @author_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default "/"
    else
      render :action => new
    end
  end
  def logout
    destroy
  end
  def destroy
    current_author_session.destroy
    flash[:notice] = "Logout Successful!"
    redirect_back_or_default '/'
  end
end
