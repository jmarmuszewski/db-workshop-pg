class OrderList < ApplicationRecord
  belongs_to :price
  belongs_to :order
end
