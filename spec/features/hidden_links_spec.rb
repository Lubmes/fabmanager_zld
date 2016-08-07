require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:fabmoment) { FactoryGirl.create(:fabmoment) }
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  context "anonymous users" do
    scenario "cannot see the New Fabmoment link" do
      visit "/"
      expect(page).not_to have_link "Nieuw Fabmoment"
    end
  end

  context "non-admin users" do
    before do
      login_as(user)
    end

    scenario "can see the New Fabmoment link" do
      visit "/"
      expect(page).to have_link "Nieuw Fabmoment"
    end
    scenario "cannot see the Delete Fabmoment link" do
      visit fabmoment_path(fabmoment)
      expect(page).not_to have_link "Verwijder Fabmoment"
    end
    scenario "can see the Edit Fabmoment link" do
      visit fabmoment_path(fabmoment)
      expect(page).to have_link "Bijwerken Fabmoment"
    end
  end

  context "admin users" do
    before { login_as(admin) }

    scenario "can see the New Fabmoment link" do
      visit "/"
      expect(page).to have_link "Nieuw Fabmoment"
    end
    scenario "can see the Delete Fabmoment link" do
      visit fabmoment_path(fabmoment)
      expect(page).to have_link "Verwijder Fabmoment"
    end
    scenario "can see the Edit Fabmoment link" do
      visit fabmoment_path(fabmoment)
      expect(page).to have_link "Bijwerken Fabmoment"
    end
  end 
end