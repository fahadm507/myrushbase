require 'spec_helper'

feature 'Registered user makes likes posts', %q{
    As a user I want to like posts that I find useful.

  } do

  scenario 'registered user succefully likes a post' do

    user = FactoryGirl.create(:user)

    visit new_user_session_path
    sign_in_as(user)

    within(".give-point") do
      expect(page).to have_content 'Credit'
    end

    within(".give-point") do
      click_on 'Credit'
    end
    save_and_open_page
    within(".give-point") do
      expect(page).to_not have_content 'Credit'
    end
  end

end
