require 'rails_helper'

RSpec.describe "meetings/show", type: :view do
  before(:each) do
    @meeting = assign(:meeting, Meeting.create!(
      :rails => "Rails",
      :g => "G",
      :scaffold => "Scaffold",
      :Meeting => "Meeting",
      :name => "Name",
      :agenda => "Calendar"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Rails/)
    expect(rendered).to match(/G/)
    expect(rendered).to match(/Scaffold/)
    expect(rendered).to match(/Meeting/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Calendar/)
  end
end
