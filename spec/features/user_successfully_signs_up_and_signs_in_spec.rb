require 'spec_helper'

feature 'User signs up and sign in', %q{
    As a user I want to sign up for the site so that I can start
    sharing useful  resources with other people
  } do

  scenario 'user sign up to start using the site' do

    visit root_path

    expect(page).to have_content "Login"
    expect(page).to have_content "Sign up"

  end

  scenario "signs up user if information is valid" do

    visit new_user_registration_path

    fill_in "Email", with: "fahadm607@gmail.com"
    fill_in "First name", with: "Fahad"
    fill_in "Last name", with: "Mukunzi"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    within('.sign-up-link') do
      click_on "Sign up"
    end

    expect(page).to have_content "Logout"

  end


   scenario "user gets errors if the input is invalid" do

   visit new_user_registration_path

    within('.sign-up-link') do
      click_on "Sign up"
    end

    count = page.body.scan("can't be blank").count
    expect(count).to eql(4)
  end

  # scenario "does not sign up a new user if password confirmation does not match" do

  #   visit new_user_registration_path

  #   fill_in "Email", with: "fahad5@gmail.com"
  #   fill_in "Password", with: "password"
  #   fill_in "Confirm password", with: "nomatch"

  #   click_on "Sign up"

  #   expect(page).to have_content "doesn't match Password"
  #   expect(page).to have_content "Sign up"
  # end

  # scenario "registered user sign in with invalid " do
  #   visit new_user_session_path

  #   fill_in "Email", with: "fahadm5@gmail.com"
  #   fill_in "Password", with: "password"

  #   click_on "Login"

  #   expect(page).to have_content "logout"
  # end

  # scenario "registered user sign in with invalid " do
  #   visit new_user_session_path

  #   fill_in "Email", with: "fahadm5@gmail.com"
  #   fill_in "Password", with: "pass"

  #   click_on "Login"

  #   expect(page).to have_content "checkout your password and try again"
  # end
end

