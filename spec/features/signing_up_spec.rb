require 'rails_helper'

RSpec.feature 'Users can sign up', type: :feature do
  scenario 'when providing valid details' do
    visit '/'
    click_link 'Inschrijven'
    fill_in 'E-mail', with: 'test@example.com'
    # Gebruik fill_in 'user_password' wanneer 
    # Capybara dubbele invoer find.
    fill_in 'Wachtwoord', with: 'password'  
    fill_in 'Wachtwoord bevestigen', with: 'password'
    click_button 'Versturen'
    
    expect(page).to have_content 'U bent ingeschreven.'
  end

  scenario 'with an avatar', js: true do
    visit '/'
    click_link 'Inschrijven'
    fill_in 'E-mail', with: 'test@example.com'
    # Gebruik fill_in 'user_password' wanneer 
    # Capybara dubbele invoer find.
    fill_in 'Wachtwoord', with: 'password'  
    fill_in 'Wachtwoord bevestigen', with: 'password'
    # Avatar uploaden
    attach_file "Avatar", Rails.root.join("spec/fixtures/avatar.png")

    click_button 'Versturen'
    expect(page).to have_content 'U bent ingeschreven.'
    # redirect to user_registration  ! inbouwen door generate controller en views !
    # expect(page).to have_selector 'img'
  end
end