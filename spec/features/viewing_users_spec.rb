require "rails_helper"

RSpec.feature "Users can view profiles", type: :feature do
  let(:profile_user) { FactoryGirl.create(:user, email: 'test@example.com') }

  let!(:fabmoment_1) { FactoryGirl.create(:fabmoment, title: "Cover for smartphone", 
                                                      author: profile_user) }
  let!(:fabmoment_2) { FactoryGirl.create(:fabmoment, title: "Pokemon character", 
                                                      author: profile_user) }
  
  let!(:comment_1) { FactoryGirl.create(:comment, text: "Comment abc", 
                                                  fabmoment: fabmoment_1,
                                                  author: profile_user) }
  let!(:comment_2) { FactoryGirl.create(:comment, text: "Comment def", 
                                                  fabmoment: fabmoment_2, 
                                                  author: profile_user) }

  before do
    visit fabmoment_path(fabmoment_1)
  end

  scenario "with the user's details" do
    click_link "test@example.com"
    expect(page.current_url).to eq user_url(profile_user)
  end

  scenario "with the user's last few comments" do
    click_link "test@example.com"
    expect(page).to have_content 'op fabmoment Pokemon'
    expect(page).to have_content 'op fabmoment Cover for smartphone'
  end 

  scenario "with the user's fabmoments" do
    click_link "test@example.com"
    expect(page).to have_content 'Cover for smartphone'
    expect(page).to have_content 'Pokemon character'
  end  
end