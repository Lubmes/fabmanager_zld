require "rails_helper"

RSpec.feature "Users can delete fabmoments", type: :feature do
  let(:author) { FactoryGirl.create(:user) }
  let(:fabmoment) { FactoryGirl.create(:fabmoment, title: "Bad Cover for smartphone", author: author) }

  before do
    login_as FactoryGirl.create(:user, :admin)
    visit fabmoment_path(fabmoment)
  end

  scenario "succesfully" do
    click_link "Verwijder Fabmoment"

    expect(page).to have_content "Fabmoment is verwijderd."
    expect(page.current_url).to eq fabmoments_url
    expect(page).to have_no_content "Bad cover for smartphone" 
  end
end