class Product < ApplicationRecord
  has_many :sales

  validates_presence_of :name, :external_id, :purchase_price
end
