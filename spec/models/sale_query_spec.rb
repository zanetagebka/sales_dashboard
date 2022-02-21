require 'rails_helper'
require 'spec_helper'

describe SaleQuery do
  let!(:product) { Product.create(name: 'laptop', purchase_price: 100, external_id: 'mac' ) }
  let!(:sale) { Sale.create(product_id: product.id, date: Time.current, quantity: 10, revenue: 100) }
  let!(:sale_from_past) { Sale.create(product_id: product.id, date: 1.year.ago, quantity: 1, revenue: 100) }


  it 'search_by_date' do
    query = SaleQuery.new(Sale.all)
    params = { start_date: '2022-02-01', end_date: '2022-02-28' }

    expect(query.call(params)).to include(sale)
    expect(query.call(params)).to_not include(sale_from_past)
  end

  it 'gets sales from current week' do
    query = SaleQuery

    expect(query.get_sales_current_week).to include(sale)
    expect(query.get_sales_current_week).to_not include(sale_from_past)
  end

  it 'gets sales from scope week' do
    query = SaleQuery
    params = '2021-02-21'

    expect(query.get_sales_from_scope_week(params)).to_not include(sale)
    expect(query.get_sales_from_scope_week(params)).to include(sale_from_past)
  end

end
