require 'rails_helper'

RSpec.feature "Users can sign up", type: :feature do
  scenario "when providing valid details" do
    visit "/"
    click_link "Aanmelden"
    fill_in "E-mail", with: "test@example.com"
    fill_in "Wachtwoord", with: "password" # Gebruik fill_in "user_password" om Capybara niet te verwaren.
    fill_in "Wachtwoord bevestigen", with: "password"
    click_button "Registreer aanmelding"
    expect(page).to have_content "U bent ingeschreven."
  end
end