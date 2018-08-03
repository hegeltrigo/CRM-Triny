require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :name => "Name",
        :office_location => "Office Location",
        :phone => "Phone",
        :person_id => 2,
        :user_id => 3
      ),
      Company.create!(
        :name => "Name",
        :office_location => "Office Location",
        :phone => "Phone",
        :person_id => 2,
        :user_id => 3
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Office Location".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
