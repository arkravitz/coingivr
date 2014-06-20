module Helpers
  def login
    @current_user = FactoryGirl.create(:user)
    fill_in "username", with: @current_user.username
    fill_in "password", with: @current_user.password
    click_on 'Login'
  end
end

World Helpers
