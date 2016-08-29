require "rails_helper"

RSpec.feature "Users can comment on tickets" do
  let(:user) { FactoryGirl.create(:user) }
  let(:fabmoment) { FactoryGirl.create(:fabmoment, author: user) }

  before do
    login_as(user)
  end

  scenario "with valid attributes" do
    visit fabmoment_path(fabmoment)

    fill_in "Tekst", with: "Commentaar geplaatst!"
    click_button "Commentaar toevoegen"

    expect(page).to have_content "Commentaar is succesvol toegevoegd."
    within("#comments") do
      expect(page).to have_content "Commentaar geplaatst!"
    end
  end

  scenario "with invalid attributes" do
    visit fabmoment_path(fabmoment)
    click_button "Commentaar toevoegen"

    expect(page).to have_content "Commentaar is niet toegevoegd."
  end
end