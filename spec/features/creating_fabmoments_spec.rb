require 'rails_helper'
### WALK THROUGH THE PARK: Behaviour Driven Development ###
# Testen volgen een AAA opbouw: Arrange - Act - Assert.
# Een applicatie opbouwen volgens de BDD aanpak betekent
# dat je eerst je testen schrijft, dan de bijhorende correcte
# code, dan alles nog eens naloopt, ook wel samengevat als:
# Red - Green - Refactor.

RSpec.feature 'Users can create new fabmoments', type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  # Arrange
  before do
    login_as(user)
    visit '/'
    click_link 'Nieuw Fabmoment'
  end

  scenario 'with valid attributes' do  # Je test wat kan...
    # Act
    within('form') do
      fill_in 'Titel', with: 'Gegraveerde foto'
      fill_in 'Omschrijving', with: 'Deze foto is met een laser gegraveerd.'
      click_button 'Fabmoment toevoegen'
    end

    # Assert
    expect(page).to have_content 'Fabmoment is succesvol toegevoegd.'
    fabmoment = Fabmoment.find_by(title: 'Gegraveerde foto')
    expect(page.current_url).to eq fabmoment_url(fabmoment)
    title = 'Gegraveerde foto - Fabmoments - FabLab'
    expect(page).to have_title title
    expect(page).to have_content "Door #{user.username}"
  end

  scenario 'when providing invalid attributes' do # ...en je test ook wat kan, maar niet moet!
    # Act
    click_button 'Fabmoment toevoegen'

    # Assert
    expect(page).to have_content 'Fabmoment is niet toegevoegd.'
    expect(page).to have_content 'Titel moet opgegeven zijn'
  end

  scenario 'with associated machines' do
    # Act
    within('form') do
      fill_in 'Titel', with: 'Gegraveerde foto'
      fill_in 'Omschrijving', with: 'Deze foto is met een laser gegraveerd.'
      within('#machines') do
        page.check 'Lasersnijder'
      end
      click_button 'Fabmoment toevoegen'
    end

    # Assert
    expect(page).to have_content 'Fabmoment is succesvol toegevoegd.'
    within('#machines') do
      expect(page).to have_content 'Lasersnijder'
    end
  end

  scenario 'with associated materials' do
    # Act
    within('form') do
      fill_in 'Titel', with: 'Gegraveerde foto'
      fill_in 'Omschrijving', with: 'Deze foto is met een laser gegraveerd.'
      within('#materials') do
        page.check 'Multiplex 3mm'
      end
      click_button 'Fabmoment toevoegen'
    end

    # Assert
    expect(page).to have_content 'Fabmoment is succesvol toegevoegd.'
    within('#materials') do
      expect(page).to have_content 'Multiplex 3mm'
    end
  end

  scenario 'with associated programs' do
    # Act
    within('form') do
      fill_in 'Titel', with: 'Gegraveerde foto'
      fill_in 'Omschrijving', with: 'Deze foto is met een laser gegraveerd.'
      within('#programs') do
        page.check 'Inkscape'
      end
      click_button 'Fabmoment toevoegen'
    end

    # Assert
    expect(page).to have_content 'Fabmoment is succesvol toegevoegd.'
    within('#programs') do
      expect(page).to have_content 'Inkscape'
    end
  end

  scenario 'with associated tags' do
    # Act
    within('form') do
      fill_in 'Titel', with: 'Gegraveerde foto'
      fill_in 'Omschrijving', with: 'Deze foto is met een laser gegraveerd.'
      fill_in 'Tags', with: 'laser afbeeldingen'
      click_button 'Fabmoment toevoegen'
    end

    # Assert
    expect(page).to have_content 'Fabmoment is succesvol toegevoegd.'
    within('#tags') do
      expect(page).to have_content 'laser'
      expect(page).to have_content 'afbeeldingen'
    end
  end

  xscenario 'with multiple images', js: true do
    # Act
    within('form') do
      fill_in 'Titel', with: 'Reeks ontwerp studies'
      fill_in 'Omschrijving', with: 'Deze maquettes komen uit verscheidene machines.'
    end
    attach_file 'Afbeeldingen', Rails.root.join('spec/fixtures/model_grof.jpg')
    attach_file 'Afbeeldingen', Rails.root.join('spec/fixtures/model_ruw.jpg')
    click_button 'Fabmoment toevoegen'

    # Assert
    expect(page).to have_content 'Fabmoment is succesvol toegevoegd.'
    fabmoment = Fabmoment.find_by(title: 'Reeks ontwerp studies')
    within('#images') do
      expect(page).to have_selector 'img'
    end
  end

  # scenario 'persisting file uploads across form displays' do
  #   # Act
  #   attach_file 'Afbeeldingen', 'spec/fixtures/model_ruw.jpg'
  #   click_button 'Fabmoment toevoegen'
  #   # Na validatie error.
  #   within('form') do
  #     fill_in 'Titel', with: 'Reeks ontwerp studies'
  #     fill_in 'Omschrijving', with: 'Deze maquettes komen uit verscheidene machines.'
  #   end
  #   click_button 'Fabmoment toevoegen'

  #   # Assert
  #   fabmoment = Fabmoment.find_by(title: 'Reeks ontwerp studies')
  #   within('#images') do
  #     expect(page).to have_selector 'img'
  #   end
  # end

  xscenario 'with a 3d-model attachment', js: true do
    # Act
    within('form') do
      fill_in 'Titel', with: 'Reeks ontwerp studies'
      fill_in 'Omschrijving', with: 'Deze maquettes komen uit verscheidene machines.'
    end
    attach_file 'Project Bestanden', Rails.root.join('spec/fixtures/the_puritan_1st_floor.stl')
    click_button 'Fabmoment toevoegen'

    # Assert
    expect(page).to have_content 'Fabmoment is succesvol toegevoegd.'
    fabmoment = Fabmoment.find_by(title: 'Reeks ontwerp studies')
    within('#attachments') do
      expect(page).to have_content 'the_puritan_1st_floor.stl'
    end
  end
end
