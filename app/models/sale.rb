class Sale < ApplicationRecord
  belongs_to :product

  broadcasts_to ->(sale) { "sales" }

  validates_presence_of :quantity, :revenue, :date, :product

  def cost
    product.purchase_price * quantity
  end

  def profit
    revenue - cost
  end
end
