require 'spec_helper'

feature 'Registered user makes likes posts', %q{
    As a user I want to like posts that I find useful.

  } do

  scenario 'registered user succefully likes a post' do

    user = FactoryGirl.create(:user)
    points = FactoryGirl.create_list(:point, user: user)

    visit new_user_session_path

    sign_in_as(point.user)

    within(".give-point") do
      click_on 'credit'
    end
      expect(user.points.count).to eq()
      expect
  end

end
