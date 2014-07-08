require 'spec_helper'

feature 'Registered user makes comments on posts', %q{
    As a user I want to comment on the posts that I find useful.
  } do

  scenario 'registered user succefully puts a comment on posts' do

    post = FactoryGirl.create(:post )
    comments = FactoryGirl.create_list(:comment, 5)

    visit new_user_session_path

    sign_in_as(post.user)
    visit users_path


    within(".comments-form") do
      fill_in "Description", with: comments.first.description
      click_on'Comment'
    end

    post.comments.each do |comment|
      expect(page).to have_content comment.description
    end
  end

  scenario 'registered user succefully puts a comment on posts' do

    post = FactoryGirl.create(:post )
    comments = FactoryGirl.create_list(:comment, 5)
    visit new_user_session_path

    sign_in_as(post.user)
    visit users_path

    within(".comments-form") do
      click_on'Comment'
    end

    expect(page).to have_content "Descriptioncan't be blank"
  end

end

