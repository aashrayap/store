class Product < ActiveRecord::Base
  has_many :order_contents
  belongs_to :category
end
