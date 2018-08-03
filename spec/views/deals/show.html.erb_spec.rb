require 'rails_helper'

RSpec.describe "deals/show", type: :view do
  before(:each) do
    @deal = assign(:deal, Deal.create!(
      :company_id => 2,
      :total_hours => "9.99",
      :user_id => 3,
      :total_price => "9.99",
      :stage_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/4/)
  end
end
