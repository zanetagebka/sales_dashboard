class SaleReportCalculation

  def initialize(sales)
    @sales = sales
  end

  def calculate_cost
    @sales.map(&:cost).inject(0, :+)
  end

  def calculate_profit
    @sales.map(&:profit).inject(0, :+)
  end
end
