require "rails_helper"

RSpec.feature "Users can view other users", type: :feature do
  let(:author) { FactoryGirl.create(:user, email: 'test@example.com') }
  let!(:fabmoment_1) { FactoryGirl.create(:fabmoment, title: "Cover for smartphone", author: author) }
  let!(:fabmoment_2) { FactoryGirl.create(:fabmoment, title: "Pokemon character", author: author) }

  before do
    visit fabmoment_path(fabmoment_1)
  end

  scenario "with the other user's details" do
    click_link "test@example.com"
    expect(page.current_url).to eq user_url(author)
  end

  scenario "with the other user's fabmoments" do
    click_link "test@example.com"
    # expect(page.current_url).to eq user_url(author)
    expect(page).to have_content 'Cover for smartphone'
    expect(page).to have_content 'Pokemon character'
  end  
end