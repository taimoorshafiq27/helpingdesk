require 'rails_helper'

RSpec.describe "Authentication", type: :system do
  it "must allow a user to sign up" do
    visit new_user_registration_url
    assert_selector "h2", text: "Sign up"

    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    expect(page).to have_text("example@example.com")
  end
end