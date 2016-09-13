class User < ApplicationRecord
  has_many :sessions
  has_many :orders
  has_one :ban
end
