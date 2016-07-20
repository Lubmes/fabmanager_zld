require 'rails_helper'

RSpec.feature "Signed-in users can sign out", type: :feature do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as user
  end

  scenario "with valid credentials" do
    visit "/"
    click_link "Log uit"
    expect(page).to have_content "U bent succesvol uitgelogd."
  end
end