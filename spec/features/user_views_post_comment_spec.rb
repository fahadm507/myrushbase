require 'spec_helper'

feature 'user views all comments on post', %q{
    As a user I want to view all comments on posts that I like.
    As a user I want to view the number of comments that a post has.
  } do

  scenario 'user views all comments on individual post' do

    post = FactoryGirl.create(:post)
    comments = FactoryGirl.create_list(:comment, 5)
    visit new_user_session_path

    sign_in_as(post.user)

    within('.comments-details') do
     post.comments.each do |comment|
        expect(page).to have_content comment.description
      end
    end
  end

  scenario 'user sees the number of comments that a post has' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    comments = FactoryGirl.create_list(:comment, 5, user: user, post: post)
    visit new_user_session_path

    sign_in_as(post.user)

    within('.comments-count') do
      expect(post.comments.count).to eq(5)
    end
  end

end
