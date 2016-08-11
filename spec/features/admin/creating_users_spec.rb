require 'rails_helper'

RSpec.feature 'Admins can create new users', type: :feature do
  let(:admin) { FactoryGirl.create(:user, :admin) }

  before do
    login_as(admin)
    visit '/'
    click_link 'Admin'
    click_link 'Gebruikers'
    click_link 'Nieuwe Gebruiker'
  end

  scenario 'with valid credentials' do
    fill_in 'E-mail', with: 'newbie@example.com'
    fill_in 'Wachtwoord', with: 'password'
    click_button 'Toevoegen'

    expect(page).to have_content 'Gebruiker is succesvol toegevoegd.'
  end

  scenario 'when the new user is an admin' do
    fill_in 'E-mail', with: 'admin@example.com'
    fill_in 'Wachtwoord', with: 'password'
    check 'Adminrechten?'

    click_button 'Toevoegen'
    expect(page).to have_content 'Gebruiker is succesvol toegevoegd.'
    expect(page).to have_content 'admin@example.com (Admin)'
  end

end