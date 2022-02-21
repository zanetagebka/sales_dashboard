module SalesHelper

  def current_week_cost_to_currency
    number_to_currency(SaleReportCalculation.new(SaleQuery.get_sales_current_week).calculate_cost, unit: 'Kč', format: "%n %u")
  end

  def current_week_profit_to_currency
    number_to_currency(SaleReportCalculation.new(SaleQuery.get_sales_current_week).calculate_profit, unit: 'Kč', format: "%n %u")
  end

  def scope_cost_to_currency
    number_to_currency(SaleReportCalculation.new(SaleQuery.get_sales_from_scope_week(params[:end_date])).calculate_cost, unit: 'Kč', format: "%n %u")
  end

  def scope_profit_to_currency
    number_to_currency(SaleReportCalculation.new(SaleQuery.get_sales_from_scope_week(params[:end_date])).calculate_profit, unit: 'Kč', format: "%n %u")
  end
end
