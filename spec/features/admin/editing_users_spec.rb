require 'rails_helper'

RSpec.feature 'Admins can change a users details', type: :feature do
  let(:admin_user) { FactoryGirl.create(:user, :admin) }
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(admin_user)
    visit admin_user_path(user)
    click_link 'Bijwerken'
  end

  scenario 'with valid details' do
    fill_in 'E-mail', with: 'new_guy@example.com'
    click_button 'Gebruiker bijwerken'

    expect(page).to have_content 'Gebruiker is succesvol bijgewerkt.'
    expect(page).to have_content 'new_guy@example.com'
    expect(page).to_not have_content user.email
  end

  scenario "when toggling a user's admin ability" do
    check 'Adminrechten?'
    click_button 'Gebruiker bijwerken'

    expect(page).to have_content 'Gebruiker is succesvol bijgewerkt.'
    expect(page).to have_content "#{user.email} (Admin)"
  end
end