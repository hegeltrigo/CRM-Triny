require 'rails_helper'

RSpec.describe "stages/edit", type: :view do
  before(:each) do
    @stage = assign(:stage, Stage.create!(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit stage form" do
    render

    assert_select "form[action=?][method=?]", stage_path(@stage), "post" do

      assert_select "input[name=?]", "stage[title]"

      assert_select "textarea[name=?]", "stage[description]"
    end
  end
end
