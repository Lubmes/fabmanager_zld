require 'rails_helper'

RSpec.describe "meetings/index", type: :view do
  before(:each) do
    assign(:meetings, [
      Meeting.create!(
        :rails => "Rails",
        :g => "G",
        :scaffold => "Scaffold",
        :Meeting => "Meeting",
        :name => "Name",
        :agenda => "Calendar"
      ),
      Meeting.create!(
        :rails => "Rails",
        :g => "G",
        :scaffold => "Scaffold",
        :Meeting => "Meeting",
        :name => "Name",
        :agenda => "Calendar"
      )
    ])
  end

  it "renders a list of meetings" do
    render
    assert_select "tr>td", :text => "Rails".to_s, :count => 2
    assert_select "tr>td", :text => "G".to_s, :count => 2
    assert_select "tr>td", :text => "Scaffold".to_s, :count => 2
    assert_select "tr>td", :text => "Meeting".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Calendar".to_s, :count => 2
  end
end
