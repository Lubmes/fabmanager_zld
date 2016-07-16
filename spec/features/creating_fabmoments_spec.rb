require 'rails_helper'

RSpec.feature "Users can create new fabmoments", type: :feature do
  before do
    visit "/"
    click_link "Nieuw Fabmoment"
  end

  # Je test wat kan...
  scenario "with valid attributes" do
    within("form") do
    fill_in "Titel", with: "Fabmoment ABC"
    fill_in "Omschrijving", with: ""
    click_button "Creëer Fabmoment"
    end

    expect(page).to have_content "Fabmoment is succesvol gecreëerd."
    
    fabmoment = Fabmoment.find_by(title: "Fabmoment ABC")
    expect(page.current_url).to eq fabmoment_url(fabmoment)

    title = "Fabmoment ABC - Fabmoments - FabLab"
    expect(page).to have_title title
  end

  # ...maar je test ook wat kan, maar niet moet!
  scenario "when providing invalid attributes" do
    click_button "Creëer Fabmoment"

    expect(page).to have_content "Fabmoment is niet gecreëerd."
    expect(page).to have_content "Titel moet opgegeven zijn"
    expect(page).to have_content "Omschrijving moet opgegeven zijn"
  end
end
