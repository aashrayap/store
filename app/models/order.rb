class Order < ActiveRecord::Base
  has_many :order_contents
  belongs_to :user
end
