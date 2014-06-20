class HomepageController < ActionController::Base
  def index
    @featured = GivePage.limit(3)
    @new_user = User.new
  end

  def sign_up
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path and return
    else
      render :index and return
    end


  end

end

private
def user_params
  params.require(:user).permit(:full_name, :username, :email, :password, :password_confirmation)
end
