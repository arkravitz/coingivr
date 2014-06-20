class HomepageController < ActionController::Base
  def index
    @featured = GivePage.limit(3)
    @new_user = User.new
  end

  def sign_up
  end
end
