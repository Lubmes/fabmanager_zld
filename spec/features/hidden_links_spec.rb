require "rails_helper"

RSpec.feature "Users can only see the appropriate links:" do
  let(:license) { FactoryGirl.create(:license) }
  let(:author) { FactoryGirl.create(:user) }
  let(:random_user) { FactoryGirl.create(:user) }
  let(:other_random_user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:fabmoment) { FactoryGirl.create(:fabmoment, author: author, license: license) }
  let(:odd_fabmoment) { FactoryGirl.create(:fabmoment, author: random_user, license: license) }

  context "anonymous users" do
    context "in the fabmoment's index" do
      scenario "cannot see the New Fabmoment link" do
        visit "/"
        expect(page).not_to have_link "Nieuw Fabmoment"
      end
    end
    context "in a fabmoment's show" do
      before { visit fabmoment_path(fabmoment) }

      scenario "cannot see the Delete Fabmoment link" do
        expect(page).not_to have_link "Verwijder Fabmoment"
      end
      scenario "cannot see the Edit Fabmoment link" do
        expect(page).not_to have_link "Bijwerken Fabmoment"
      end
      scenario "cannot see the New Comment link" do
        expect(page).not_to have_button "Commentaar toevoegen"
      end
    end
    context "in a user's show" do
      scenario "cannot see the Edit User link" do
        visit user_path(random_user)
        expect(page).not_to have_button "Bijwerken"
      end
      scenario "cannot see the Archive User link" do
        visit user_path(random_user)
        expect(page).not_to have_button "Archiveer"
      end
    end
  end

  context "random users" do
    before do
      login_as(random_user)
    end

    context "in the fabmoment's index" do
      scenario "can see the New Fabmoment link" do
        visit "/"
        expect(page).to have_link "Nieuw Fabmoment"
      end
    end
    context "in a fabmoment's show" do
      before { visit fabmoment_path(fabmoment) }

      scenario "cannot see the Delete Fabmoment link" do
        expect(page).not_to have_link "Verwijder Fabmoment"
      end
      scenario "cannot see the Edit Fabmoment link" do
        expect(page).not_to have_link "Bijwerken Fabmoment"
      end
      scenario "can see the New Comment link" do
          expect(page).to have_button "Commentaar toevoegen"
      end
    end
    context "in a user's show" do
      scenario "cannot see the Edit User link" do
        visit user_path(other_random_user)
        expect(page).not_to have_button "Bijwerken"
      end
      scenario "cannot see the Archive User link" do
        visit user_path(other_random_user)
        expect(page).not_to have_link "Archiveer"
      end
      scenario "can see the Edit User link when viewing own profile" do
        visit user_path(random_user)
        expect(page).to have_link "Bijwerken"
      end
    end
  end

  context "authors" do
    before do
      login_as(author)
    end

    context "in the fabmoment's index" do
      scenario "can see the New Fabmoment link" do
        visit "/"
        expect(page).to have_link "Nieuw Fabmoment"
      end
    end
    context "in a fabmoment's show" do
      before { visit fabmoment_path(fabmoment) }

      scenario "cannot see the Delete Fabmoment link" do
        expect(page).not_to have_link "Verwijder Fabmoment"
      end
      scenario "can see the Edit Fabmoment link on fabmoments of themselves" do
        expect(page).to have_link "Bijwerken Fabmoment"
      end
      scenario "cannot see the Edit Fabmoment link on fabmoments of others" do
        visit fabmoment_path(odd_fabmoment)
        expect(page).not_to have_link "Bijwerken Fabmoment"
      end
      scenario "can see the New Comment link" do
        expect(page).to have_button "Commentaar toevoegen"
      end
    end
    # De logica voor de niet-admin user's show hoeft hier
    # natuurlijk niet nogmaals vastgelegd te worden.
  end

  context "admin users" do
    before { login_as(admin) }

    context "in the fabmoment's index" do
      scenario "can see the New Fabmoment link" do
        visit "/"
        expect(page).to have_link "Nieuw Fabmoment"
      end
    end
    context "in a fabmoment's show" do
      before { visit fabmoment_path(fabmoment) }

      scenario "can see the Delete Fabmoment link" do
        expect(page).to have_link "Verwijder Fabmoment"
      end
      scenario "can see the Edit Fabmoment link" do
        expect(page).to have_link "Bijwerken Fabmoment"
      end
      scenario "can see the New Comment link" do
        expect(page).to have_button "Commentaar toevoegen"
      end
    end
    context "in a user's show" do
      scenario "can see the Edit User link" do
        visit admin_user_path(random_user)
        expect(page).to have_link "Bijwerken"
      end
      scenario "can see the Archive User link" do
        visit admin_user_path(random_user)
        expect(page).to have_link "Archiveer"
      end
      # Aangezien de foutmelding voor het zelf-archiveren van
      # de admin mooi werkt gaan deze links nooit weg.
    end
  end 
end