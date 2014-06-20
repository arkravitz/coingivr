class GivePageController < ApplicationController
  def create
  end

  def show
    @current_page = GivePage.find_by_id(params[:id])
    if session[:user_id] && @current_page.user.id == session[:user_id]
      redirect_to action: 'edit'
    elsif !@current_page
      redirect_to root_path
    end
  end

  def new
  end

  def index
  end

  def edit
    @current_page = GivePage.find_by_id(params[:id])
    if !(session[:user_id] && @current_page.user.id == session[:user_id])
      redirect_to action: 'show'
    end
  end

  def update
  end

  def destroy
  end
end
