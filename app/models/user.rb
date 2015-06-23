class User < ActiveRecord::Base
  before_create :generate_authentication_token!

  include SoftDeletable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: {in: 2..35}
  validates :auth_token, uniqueness: true

  def generate_authentication_token!
    begin 
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
