class User < ActiveRecord::Base
  has_secure_password

  has_many :give_pages
end
