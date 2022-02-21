require 'rails_helper'
require 'spec_helper'

describe SalesController do

  render_views

  it 'get index' do
    get :index
    expect(response).to be_successful
  end
end
