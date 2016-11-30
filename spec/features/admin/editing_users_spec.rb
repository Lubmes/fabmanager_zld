require 'rails_helper'

RSpec.feature 'Admins can change a users details', type: :feature do
  let(:admin_user) { FactoryGirl.create(:user, :admin) }
  let(:user) { FactoryGirl.create(:user, :username => 'dull_name' ) }

  before do
    login_as(admin_user)
    visit admin_user_path(user)
    click_link 'Bijwerken'
  end

  scenario 'with valid details' do
    fill_in 'Gebruikersnaam', with: 'shiny_name'
    click_button 'Gebruiker bijwerken'

    expect(page).to have_content 'Gebruiker is succesvol bijgewerkt.'
    expect(page).to have_content 'shiny_name'
    expect(page).to_not have_content user.username
  end

  scenario "when toggling a user's admin ability" do
    check 'Adminrechten?'
    click_button 'Gebruiker bijwerken'

    expect(page).to have_content 'Gebruiker is succesvol bijgewerkt.'
    expect(page).to have_content "#{user.username} (Admin)"
  end
end
