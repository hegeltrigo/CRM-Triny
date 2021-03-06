require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :name => "Name",
      :office_location => "Office Location",
      :phone => "Phone",
      :person_id => 2,
      :user_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Office Location/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
