require 'spec_helper'

feature 'Registered user creates posts', %q{
    As a user I want to visit other user profiles  so that I can view their posts
    and possibly follow them.
    Acceptance: user should be able to go another user's profile, posts
  } do

  scenario 'logged in user clicks view memebers, and click on individual user' do

    user = FactoryGirl.create(:user)
    members = FactoryGirl.create(:user, 10)
    member = member.first
    sign_in_as(user)
    visit members_path

    within('.all-members') do
      click_on member
    end

    expect(page).to have_content
  end

  scenario 'user signs in and visits their dashboard, user attempts to submit and empty form' do

    post = FactoryGirl.create(:post)
    visit new_user_session_path

    sign_in_as(post.user)
    within('.post-form') do
      click_on'Post'
    end

    expect(page).to have_content "Bodycan't be blank"
  end

end

