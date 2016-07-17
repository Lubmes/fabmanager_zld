require "rails_helper"

RSpec.feature "Users can view fabmoments", type: :feature do
  let!(:fabmoment) { FactoryGirl.create(:fabmoment, title: "Cover for smartphone") }

  scenario "with the fabmoment details" do
    visit "/"
    click_link "Cover for smartphone"
    expect(page.current_url).to eq fabmoment_url(fabmoment)
  end
end