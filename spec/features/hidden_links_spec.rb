require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:author) { FactoryGirl.create(:user) }
  let(:random_user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:fabmoment) { FactoryGirl.create(:fabmoment, author: author) }
  let(:odd_fabmoment) { FactoryGirl.create(:fabmoment, author: random_user) }

  context "anonymous users" do
    scenario "cannot see the New Fabmoment link" do
      visit "/"
      expect(page).not_to have_link "Nieuw Fabmoment"
    end
    scenario "cannot see the Delete Fabmoment link" do
      visit fabmoment_path(fabmoment)
      expect(page).not_to have_link "Verwijder Fabmoment"
    end
    scenario "cannot see the Edit Fabmoment link" do
      visit fabmoment_path(fabmoment)
      expect(page).not_to have_link "Bijwerken Fabmoment"
    end
  end

  context "random users" do
    before do
      login_as(random_user)
    end

    scenario "can see the New Fabmoment link" do
      visit "/"
      expect(page).to have_link "Nieuw Fabmoment"
    end
    scenario "cannot see the Delete Fabmoment link" do
      visit fabmoment_path(fabmoment)
      expect(page).not_to have_link "Verwijder Fabmoment"
    end
    scenario "cannot see the Edit Fabmoment link" do
      visit fabmoment_path(fabmoment)
      expect(page).not_to have_link "Bijwerken Fabmoment"
    end
  end

  context "authors" do
    before do
      login_as(author)
    end

    scenario "can see the New Fabmoment link" do
      visit "/"
      expect(page).to have_link "Nieuw Fabmoment"
    end
    scenario "cannot see the Delete Fabmoment link" do
      visit fabmoment_path(fabmoment)
      expect(page).not_to have_link "Verwijder Fabmoment"
    end
    scenario "can see the Edit Fabmoment link on fabmoments of themselves" do
      visit fabmoment_path(fabmoment)
      expect(page).to have_link "Bijwerken Fabmoment"
    end
    scenario "cannot see the Edit Fabmoment link on fabmoments of others" do
      visit fabmoment_path(odd_fabmoment)
      expect(page).not_to have_link "Bijwerken Fabmoment"
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