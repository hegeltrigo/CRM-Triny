require 'rails_helper'

RSpec.describe "deals/index", type: :view do
  before(:each) do
    assign(:deals, [
      Deal.create!(
        :company_id => 2,
        :total_hours => "9.99",
        :user_id => 3,
        :total_price => "9.99",
        :stage_id => 4
      ),
      Deal.create!(
        :company_id => 2,
        :total_hours => "9.99",
        :user_id => 3,
        :total_price => "9.99",
        :stage_id => 4
      )
    ])
  end

  it "renders a list of deals" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
