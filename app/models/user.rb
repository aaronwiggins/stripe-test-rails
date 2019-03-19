class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:stripe_connect]

  has_many :sellers, dependent: :destroy

  def is_seller?
    #seller already exist?
    sellers.any?
  end

  def can_receive_payments?
    #registered on platform?
    uid? && provider? && access_code? && publishable_key?
  end

end
