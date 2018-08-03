require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone_number => "MyString",
      :company_id => 1,
      :user_id => 1
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input[name=?]", "person[first_name]"

      assert_select "input[name=?]", "person[last_name]"

      assert_select "input[name=?]", "person[email]"

      assert_select "input[name=?]", "person[phone_number]"

      assert_select "input[name=?]", "person[company_id]"

      assert_select "input[name=?]", "person[user_id]"
    end
  end
end
