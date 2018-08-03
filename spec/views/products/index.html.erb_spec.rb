require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :title => "Title",
        :hourly_rate => "Hourly Rate",
        :user_id => 2
      ),
      Product.create!(
        :title => "Title",
        :hourly_rate => "Hourly Rate",
        :user_id => 2
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Hourly Rate".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
