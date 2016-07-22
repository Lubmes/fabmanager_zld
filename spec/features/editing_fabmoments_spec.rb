require "rails_helper"

RSpec.feature "Users can edit fabmoments", type: :feature do
  let(:fabmoment) { FactoryGirl.create(:fabmoment, title: "Nice Cover for smartphone") }
  let(:user) { FactoryGirl.create(:user) }


  before do
    login_as(user)
    visit fabmoment_path(fabmoment)
    click_link "Bijwerken Fabmoment"
  end

  # Bij 'edit' geldt, net als bij create, je test wat kan...
  scenario "with valid details" do
    within("form") do
      fill_in "Titel", with: "Way beter cover for smartphone"
      click_button "Fabmoment bijwerken" # Roept update actie aan.
    end

    expect(page).to have_content "Fabmoment is bijgewerkt."
    expect(page).to have_content "Way beter cover for smartphone"
  end

  # ...en ook wat kan, maar niet moet.
  scenario "when providing invalid attributes" do
    fill_in "Titel", with: ""
    click_button "Fabmoment bijwerken" # Roept update actie aan.

    expect(page).to have_content "Fabmoment is niet bijgewerkt."
  end
end