require 'rails_helper'

RSpec.feature "Users can sign up", type: :feature do
  scenario "when providing valid details" do
    visit "/"
    click_link "Inschrijven"
    fill_in "E-mail", with: "test@example.com"
    fill_in "Wachtwoord", with: "password" # Gebruik fill_in "user_password" wanneer Capybara dubbele invoer find.
    fill_in "Wachtwoord bevestigen", with: "password"
    click_button "Versturen"
    expect(page).to have_content "U bent ingeschreven."
  end
end