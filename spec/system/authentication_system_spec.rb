require 'rails_helper'

RSpec.describe "Authentication", type: :system do
  it "must allow a user to sign up" do
    visit new_user_registration_url
    assert_selector "h2", text: "Sign up"

    fill_in "First name", with: "Bob"
    fill_in "Last name", with: "Page"
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    
    expect(page).to have_text("Welcome! You have signed up successfully.")
  end
  
  it "must allow a user to sign in" do
    user = create(:user)

    visit user_session_url
    assert_selector "h2", text: "Log in"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"

    expect(page).to have_text("Signed in successfully.")
  end
end