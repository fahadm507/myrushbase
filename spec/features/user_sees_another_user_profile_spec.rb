require 'spec_helper'

feature 'Registered user creates posts', %q{
    As a user I want to visit other user profiles  so that I can view their posts
    and possibly follow them.
    Acceptance: user should be able to go another user's profile, posts
  } do

  scenario 'logged in user clicks view memebers, and click on individual user' do

    user = FactoryGirl.create(:user)
    member = FactoryGirl.create(:user)
    posts = FactoryGirl.create_list(:post, 10, user: member)


    sign_in_as(user)

    visit '/members'

      click_link "#{member.first_name} #{member.last_name}"

    expect(page).to have_content member.first_name
    expect(page).to have_content member.last_name

  end

end

