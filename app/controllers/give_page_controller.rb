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
    @page = GivePage.find(params[:id])

  if !(session[:user_id] && @page.user.id == session[:user_id])
    redirect_to action: show and return
  end

  if @page.update(give_page_params())
    redirect_to @page and return
  else
    render 'edit'
  end

    redirect_to action: 'edit' and return
  end

  def destroy
  end

private
  def give_page_params
    params.require(:give_page).permit(:title, :desc, :publicBTC)
  end
end
