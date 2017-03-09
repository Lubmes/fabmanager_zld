require "rails_helper"

RSpec.feature "Users can delete unwanted tags from a ticket" do
  let(:user) { FactoryGirl.create(:user) }
  let(:license) { FactoryGirl.create(:license) }
  let(:fabmoment) do
    FactoryGirl.create(:fabmoment, tag_names: "ThisTagMustDie", author: user, license: license)
  end

  before do
    login_as user
    visit fabmoment_path(fabmoment)
  end

  xscenario "succesfully", js: true do
    within tag("ThisTagMustDie") do
      click_link "remove"
    end
    expect(page).to_not have_content "ThisTagMustDie"
  end
end
