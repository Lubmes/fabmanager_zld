require 'rails_helper'

RSpec.describe "meetings/edit", type: :view do
  before(:each) do
    @meeting = assign(:meeting, Meeting.create!(
      :rails => "MyString",
      :g => "MyString",
      :scaffold => "MyString",
      :Meeting => "MyString",
      :name => "MyString",
      :agenda => "MyString"
    ))
  end

  it "renders the edit meeting form" do
    render

    assert_select "form[action=?][method=?]", meeting_path(@meeting), "post" do

      assert_select "input#meeting_rails[name=?]", "meeting[rails]"

      assert_select "input#meeting_g[name=?]", "meeting[g]"

      assert_select "input#meeting_scaffold[name=?]", "meeting[scaffold]"

      assert_select "input#meeting_Meeting[name=?]", "meeting[Meeting]"

      assert_select "input#meeting_name[name=?]", "meeting[name]"

      assert_select "input#meeting_calendar[name=?]", "meeting[agenda]"
    end
  end
end
