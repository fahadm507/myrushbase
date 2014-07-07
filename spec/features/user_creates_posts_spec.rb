require 'spec_helper'

feature 'Registered user creates posts', %q{
    As a user I want to create posts so that I can share with
    my followers.
  } do

  scenario 'user signs in and visits their dashboard and succefully creates a post' do

    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    visit new_user_session_path

    sign_in_as(user)

    within('.post-form') do
      fill_in "Body", with: post.body
      click_on'Post'
    end

    expect(page).to have_content post.body
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

