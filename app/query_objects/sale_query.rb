class SaleQuery
  attr_accessor :initial_scope

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
