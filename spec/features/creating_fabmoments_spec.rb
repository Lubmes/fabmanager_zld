require 'rails_helper'
### WALK THROUGH THE PARK: Behaviour Driven Development ###
# Testen volgen een AAA opbouw: Arrange - Act - Assert.
# Een applicatie opbouwen volgens de BDD aanpak betekent
# dat je eerst je testen schrijft, dan de bijhorende correcte 
# code, dan alles nog eens naloopt, ook wel samengevat als: 
# Red - Green - Refactor.

RSpec.feature "Users can create new fabmoments", type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  # Arrange
  before do
    login_as(user)
    visit "/"
    click_link "Nieuw Fabmoment"
  end

  scenario "with valid attributes" do  # Je test wat kan...
    # Act
    within("form") do
      fill_in "Titel", with: "Gegraveerde foto"
      fill_in "Omschrijving", with: "Deze foto is met een laser gegraveerd."
      click_button "Fabmoment toevoegen"
    end

    # Assert
    expect(page).to have_content "Fabmoment is succesvol toegevoegd."
    fabmoment = Fabmoment.find_by(title: "Gegraveerde foto")
    expect(page.current_url).to eq fabmoment_url(fabmoment)
    title = "Gegraveerde foto - Fabmoments - FabLab"
    expect(page).to have_title title
  end

  scenario "when providing invalid attributes" do # ...en je test ook wat kan, maar niet moet!
    # Act
    click_button "Fabmoment toevoegen"

    # Assert
    expect(page).to have_content "Fabmoment is niet toegevoegd."
    expect(page).to have_content "Titel moet opgegeven zijn"
  end

  scenario "with associated machines" do
    # Act
    within("form") do
      fill_in "Titel", with: "Gegraveerde foto"
      fill_in "Omschrijving", with: "Deze foto is met een laser gegraveerd."
      within("#machines") do
        page.check "Lasersnijder"
      end
      click_button "Fabmoment toevoegen"
    end

    # Assert
    expect(page).to have_content "Fabmoment is succesvol toegevoegd."
    within("#machines") do
      expect(page).to have_content "Lasersnijder"
    end
  end

  scenario "with associated materials" do
    # Act
    within("form") do
      fill_in "Titel", with: "Gegraveerde foto"
      fill_in "Omschrijving", with: "Deze foto is met een laser gegraveerd."
      within("#materials") do
        page.check "Multiplex 3mm"
      end
      click_button "Fabmoment toevoegen"
    end

    # Assert
    expect(page).to have_content "Fabmoment is succesvol toegevoegd."
    within("#materials") do
      expect(page).to have_content "Multiplex 3mm"
    end
  end

  scenario "with associated programs" do
    # Act
    within("form") do
      fill_in "Titel", with: "Gegraveerde foto"
      fill_in "Omschrijving", with: "Deze foto is met een laser gegraveerd."
      within("#programs") do
        page.check "Inkscape"
      end
      click_button "Fabmoment toevoegen"
    end
    
    # Assert
    expect(page).to have_content "Fabmoment is succesvol toegevoegd."
    within("#programs") do
      expect(page).to have_content "Inkscape"
    end
  end

end
