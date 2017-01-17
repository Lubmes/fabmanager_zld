require 'rails_helper'

RSpec.feature 'Users can search for fabmoments matching specific criteria' do
  let(:user) { FactoryGirl.create(:user) }
  let(:license) { FactoryGirl.create(:license) }

  let!(:fabmoment_1) do
    FactoryGirl.create(:fabmoment, title: 'Experimenten', author: user, tag_names: 'iteration_1', license: license)
  end

  let!(:fabmoment_2) do
    FactoryGirl.create(:fabmoment, title: 'Studies + Maquette', author: user, tag_names: 'iteration_2', license: license)
  end

  before do
    login_as(user)
    visit '/'
  end

  xscenario 'searching by tag' do
    fill_in 'search', with: 'tag:iteration_1'
    click_button 'Zoek'
    within('#fabmoments') do
      expect(page).to have_link 'Experimenten'
      expect(page).to_not have_link 'Studies + Maquette'
    end
  end

  scenario 'searching by fabmoment' do
    fill_in 'search', with: 'Maquette'
    click_button 'Zoek'
    within('#fabmoments') do
      expect(page).to have_link 'Studies + Maquette'
      expect(page).to_not have_link 'Experimenten'
    end
  end

  xscenario 'when clicking on a tag' do
    click_link 'Studies'
    click_link 'iteration_1'
    within('#fabmoments') do
      expect(page).to have_content 'Experimenten'
      expect(page).to_not have_content 'Studies + Maquette'
    end
  end
end