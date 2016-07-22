require 'rails_helper'

RSpec.feature "Users can create new fabmoments", type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user)
    visit "/"
    click_link "Nieuw Fabmoment"
  end

  # Je test wat kan...
  scenario "with valid attributes" do
    within("form") do
      fill_in "Titel", with: "Laser Foto"
      fill_in "Omschrijving", with: "Deze foto is met een laser gegraveerd."
      click_button "Fabmoment toevoegen"
    end

    expect(page).to have_content "Fabmoment is succesvol toegevoegd."
    
    fabmoment = Fabmoment.find_by(title: "Laser Foto")
    expect(page.current_url).to eq fabmoment_url(fabmoment)

    title = "Laser Foto - Fabmoments - FabLab"
    expect(page).to have_title title
  end

  # ...en je test ook wat kan, maar niet moet!
  scenario "when providing invalid attributes" do
    click_button "Fabmoment toevoegen"

    expect(page).to have_content "Fabmoment is niet toegevoegd."
    expect(page).to have_content "Titel moet opgegeven zijn"
  end

  scenario "with associated machines" do
    fill_in "Titel", with: "Laser Foto"
    fill_in "Omschrijving", with: "Deze foto is met een laser gegraveerd."
    select "Lasersnijder", from: "Machines"
    click_button "Fabmoment toevoegen"

    expect(page).to have_content "Fabmoment is succesvol toegevoegd."
    within("#ticket #machines") do
      expect(page).to have_content ""
      expect(page).to have_content ""
    end
  end
end
