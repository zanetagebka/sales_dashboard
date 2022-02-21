class SaleReportCalculation

  def initialize(sales)
    @sales = sales
  end

  def calculate_cost
    return if @sales.nil?

    @sales.map(&:cost).inject(0, :+)
  end

  def calculate_profit
    return if @sales.nil?

    @sales.map(&:profit).inject(0, :+)
  end
end
