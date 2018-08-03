require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      :name => "MyString",
      :office_location => "MyString",
      :phone => "MyString",
      :person_id => 1,
      :user_id => 1
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input[name=?]", "company[name]"

      assert_select "input[name=?]", "company[office_location]"

      assert_select "input[name=?]", "company[phone]"

      assert_select "input[name=?]", "company[person_id]"

      assert_select "input[name=?]", "company[user_id]"
    end
  end
end
