class Seller < ApplicationRecord
  belongs_to :user
  has_many :charges
  has_many :items
  

end
