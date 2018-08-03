require 'rails_helper'

RSpec.describe "deals/new", type: :view do
  before(:each) do
    assign(:deal, Deal.new(
      :company_id => 1,
      :total_hours => "9.99",
      :user_id => 1,
      :total_price => "9.99",
      :stage_id => 1
    ))
  end

  it "renders new deal form" do
    render

    assert_select "form[action=?][method=?]", deals_path, "post" do

      assert_select "input[name=?]", "deal[company_id]"

      assert_select "input[name=?]", "deal[total_hours]"

      assert_select "input[name=?]", "deal[user_id]"

      assert_select "input[name=?]", "deal[total_price]"

      assert_select "input[name=?]", "deal[stage_id]"
    end
  end
end
