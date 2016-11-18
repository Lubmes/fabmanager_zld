require 'rails_helper'

RSpec.feature "Users can sign in", type: :feature do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "with valid credentials" do
    visit "/"
    click_link "Inloggen"
    fill_in "", with: user.username
    fill_in "Wachtwoord", with: "password"
    click_button "Login"

    expect(page).to have_content "U bent succesvol ingelogd."
    expect(page).to have_content "Ingelogd als #{user.username}"
  end

  scenario "unless they are archived" do
    user.archive

    visit "/"
    click_link "Inloggen"
    fill_in "Gebruikersnaam", with: user.username
    fill_in "Wachtwoord", with: "password"
    click_button "Login"

    expect(page).to have_content "Uw account is gearchiveerd."
  end
end