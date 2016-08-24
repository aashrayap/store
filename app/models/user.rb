class User < ActiveRecord::Base
  has_many :addresses
  has_many :credit_cards
  has_many :orders
end
