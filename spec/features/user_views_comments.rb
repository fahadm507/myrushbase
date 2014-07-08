require 'spec_helper'

feature 'user views all comments on post', %q{
    As a user I want to view all comments on posts that I like.
  } do

  scenario 'user comments on individual post' do

    post = FactoryGirl.create(:post)
    comments = FactoryGirl.create_list(:comment, 5)
    visit new_user_session_path

    sign_in_as(post.user)

    within('.post-comments') do
     post.comments.each do |comment|
        expect(page).to have_content comment.description
      end
    end
    expect(page).to have_content post.body
  end
end

