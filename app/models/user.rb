class User < ActiveRecord::Base
  devise :database_authenticatable, :token_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :ensure_authentication_token
  has_many :omms, :dependent => :destroy
end
