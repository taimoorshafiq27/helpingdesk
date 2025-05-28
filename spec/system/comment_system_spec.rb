require "rails_helper"

RSpec.describe "Comment", type: :system do
  it "must allow a user to post a comment" do
    user = create(:user, :assign_role)

    visit user_session_path
    assert_selector "h2", text: "Sign in"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"

    ticket = create(:ticket, client: user)
    visit ticket_path(ticket)
    assert_selector "p", text: "#{ticket.title}"

    fill_in "comment_body", with: "Comment body"
    click_on "Add comment"
    expect(page).to have_text("Comment body")
  end
end