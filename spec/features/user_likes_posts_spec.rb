require 'spec_helper'

feature 'Registered user makes likes posts', %q{
    As a user I want to like posts that I find useful.

  } do

  scenario 'registered user succefully likes a post' do

    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    likes = FactoryGirl.create_list(:like, 5, user: user)

    visit new_user_session_path

    sign_in_as(post.user)

    within(".like") do
      click_on 'Like'
    end

    within(".comment-like-btns") do
      expect(page).to have_content post.likes.count
    end
  end

  scenario 'registered succeffully unlikes the post' do

    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    like = FactoryGirl.create(:like, user: user)

    visit new_user_session_path

    sign_in_as(post.user)

    within(".like") do
      click_on 'Like'
    end

    within(".comment-like-btns") do
      click_on 'liked'
    end


  end


end
