class HomepageController < ActionController::Base
  def index
    @featured = GivePage.limit(3)
  end
end
