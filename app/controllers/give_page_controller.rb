class GivePageController < ApplicationController
  def create
  end

  def show
    @current_page = GivePage.find_by_id(params[:id])
    if !@current_page
      redirect_to root_path
    end
  end

  def new
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
