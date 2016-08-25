require "rails_helper"

RSpec.feature "Users can edit fabmoments", type: :feature do
  let(:author) { FactoryGirl.create(:user) }
  let(:fabmoment) { FactoryGirl.create(:fabmoment, title: "Schuur", author: author) }

  before do
    login_as author
    visit fabmoment_path(fabmoment)
    click_link "Bijwerken Fabmoment"
  end

  # Bij 'edit' geldt, net als bij create, je test wat kan...
  scenario "with valid details" do
    within("form") do
      fill_in "Titel", with: "Huis"
      click_button "Fabmoment bijwerken" # Roept update actie aan.
    end

    expect(page).to have_content "Fabmoment is bijgewerkt."
    expect(page).to have_content "Huis"
  end

  # ...en ook wat kan, maar niet moet.
  scenario "when providing invalid attributes" do
    fill_in "Titel", with: ""
    click_button "Fabmoment bijwerken" # Roept update actie aan.

    expect(page).to have_content "Fabmoment is niet bijgewerkt."
  end

  scenario 'by removing a project file', js: true do
    # Act
    attach_file 'Project Bestanden', Rails.root.join('spec/fixtures/the_puritan_1st_floor.stl')
    click_button 'Fabmoment bijwerken'
    visit fabmoment_path(fabmoment)
    within file("the_puritan_1st_floor.stl") do
      click_link "remove"
    end

    visit fabmoment_path(fabmoment)

    # Assert
    expect(page).to_not have_content 'the_puritan_1st_floor.stl'
  end
end