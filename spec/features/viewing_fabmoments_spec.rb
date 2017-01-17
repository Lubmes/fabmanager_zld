require "rails_helper"

RSpec.feature "Users can view fabmoments", type: :feature do
  let(:license) { FactoryGirl.create(:license) }
  let(:author) { FactoryGirl.create(:user) }
  let!(:fabmoment) { FactoryGirl.create(:fabmoment, title: "Cover for smartphone", author: author, license: license) }

  scenario "with the fabmoment details" do
    visit "/"
    click_link "Cover for smartphone"
    expect(page.current_url).to eq fabmoment_url(fabmoment)
  end
end