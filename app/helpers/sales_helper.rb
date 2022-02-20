module SalesHelper

  def cost_to_currency
    number_to_currency(SaleReportCalculation.new(@sales).calculate_cost, unit: 'Kč', format: "%n %u")
  end

  def profit_to_currency
    number_to_currency(SaleReportCalculation.new(@sales).calculate_profit, unit: 'Kč', format: "%n %u")
  end
end
