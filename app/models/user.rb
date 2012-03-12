class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true
  validates :privilege, :presence => true
end
