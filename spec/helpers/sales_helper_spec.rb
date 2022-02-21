require 'rails_helper'
require 'spec_helper'

describe SalesHelper, type: :helper do
  let!(:product) { Product.create(name: 'laptop', purchase_price: 100, external_id: 'mac' ) }
  let!(:sale) { Sale.create(product: product, date: Time.current, quantity: 10, revenue: 100) }
  let!(:sale_from_past) { Sale.create(product: product, date: 1.year.ago, quantity: 1, revenue: 100) }

  context 'scoped week' do
    before(:each) do
      allow(helper).to receive(:params).and_return(end_date: '2021-09-10')
    end

    it '#scope_profit_to_currency' do
      expect(helper.scope_profit_to_currency).to eq("0.00 Kč")
    end

    it 'scope_cost_to_currency' do
      expect(helper.scope_cost_to_currency).to eq("0.00 Kč")
    end
  end

  context 'current week' do
    it 'current_week_profit_to_currency' do
      expect(helper.current_week_profit_to_currency).to eq("-900.00 Kč")
    end

    it 'current_week_cost_to_currency' do
      expect(helper.current_week_cost_to_currency).to eq("1,000.00 Kč")
    end
  end
end
