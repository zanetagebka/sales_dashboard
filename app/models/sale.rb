class Sale < ApplicationRecord
  belongs_to :product

  broadcasts_to ->(sale) { "sales" }

  def cost
    product.purchase_price * quantity
  end

  def profit
    revenue - cost
  end
end
