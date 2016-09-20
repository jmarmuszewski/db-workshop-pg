class Product < ApplicationRecord
  has_many :prices
  # attr_accessor :price1
#  scope :lates_price => { where}
end
