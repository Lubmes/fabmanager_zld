require 'rails_helper'

RSpec.feature 'An admin can archive users', type: :feature do
  let(:admin_user) { FactoryGirl.create(:user, :admin) }
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(admin_user)
  end

  scenario "succesfully" do
    visit admin_user_path(user)
    click_link "Archiveer"

    expect(page).to have_content "Gebruiker is gearchiveerd."
    expect(page).to_not have_content user.email
  end

  scenario "but cannot archive themselves" do
    visit admin_user_path(admin_user)
    click_link "Archiveer"

    expect(page).to have_content "Je kunt jezelf niet archiveren!"
  end
end
