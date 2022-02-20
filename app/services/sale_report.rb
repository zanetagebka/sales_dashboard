class SaleReport

  def initialize(sale)
    @sale = sale
  end

  def calculate_cost

  end

  private

  def cost(sale)
    sale.product.purchase_price * sale.quantity
  end

  def profit(sale)
    sale.revenue - cost(sale)
  end
end
