require 'rails_helper'

RSpec.describe "stages/index", type: :view do
  before(:each) do
    assign(:stages, [
      Stage.create!(
        :title => "Title",
        :description => "MyText"
      ),
      Stage.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of stages" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
