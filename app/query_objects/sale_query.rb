class SaleQuery
  attr_accessor :initial_scope

  class << self
    def get_sales_from_scope_week(end_date)
      current_time = end_date&.to_date
      return if current_time.blank?

      self.new(Sale.all).call(
        {
          start_date: current_time.days_ago(7),
          end_date: current_time
        })
    end

    def get_sales_current_week
      current_time = Time.current.to_date

      self.new(Sale.all).call(
        {
          start_date: current_time.days_ago(7),
          end_date: current_time.strftime("%Y-%m-%d")
        })
    end
  end

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    search(initial_scope, params[:start_date], params[:end_date])
  end

  private

  def search(scoped, starts = nil, ends = nil)
    starts ? scoped.includes(:product).where("date BETWEEN ? AND ?", starts, ends) : scoped
  end

end
