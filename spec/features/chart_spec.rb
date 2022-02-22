require 'spec_helper'
require 'rails_helper'

feature 'chart', js: true do

  before(:each) do
    Capybara.current_driver = :selenium
  end

  it 'can filter chart by dates' do
    visit sales_path

    fill_in 'start_date', with: '2022-02-20'
    fill_in 'end_date', with: '2022-02-22'

    click_button 'Search'

    expect(page).to have_text('Total Profit from last week')
    expect(page).to have_text('2.00 Kč')
  end
end
