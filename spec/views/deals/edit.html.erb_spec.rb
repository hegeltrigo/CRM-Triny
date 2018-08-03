require 'rails_helper'

RSpec.describe "deals/edit", type: :view do
  before(:each) do
    @deal = assign(:deal, Deal.create!(
      :company_id => 1,
      :total_hours => "9.99",
      :user_id => 1,
      :total_price => "9.99",
      :stage_id => 1
    ))
  end

  it "renders the edit deal form" do
    render

    assert_select "form[action=?][method=?]", deal_path(@deal), "post" do

      assert_select "input[name=?]", "deal[company_id]"

      assert_select "input[name=?]", "deal[total_hours]"

      assert_select "input[name=?]", "deal[user_id]"

      assert_select "input[name=?]", "deal[total_price]"

      assert_select "input[name=?]", "deal[stage_id]"
    end
  end
end
