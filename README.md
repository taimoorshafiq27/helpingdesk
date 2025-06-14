# README

Welcome to HelpingDesk! This application simulates a real IT ticketing system.</br>

The application consists of:
- Users
- Different roles such as *agent* and *client* to provide RBAC authorization functionality
- Tickets which are the core of the application, providing a central point of communication between different types of users
- Passing automated test suite built with RSpec

Please explore the closed GitHub Issues, as well as closed pull requests.

## Automated Test Suite

If you would like to run the automated test suite locally, please follow these steps (NOTE: This project uses PostgreSQL. If you are unable to install or run Postgres locally, please read more about the test suite in the [Test Suite Overview](https://github.com/taimoorshafiq27/helpingdesk) section of the README):

1. Clone the repo: `git clone https://github.com/taimoorshafiq27/helpingdesk.git`
2. Navigate to the project directory and run `bundle install` to install any dependencies
3. Set up the database (PostgreSQL must be running locally): rails db:create; rails db:migrate; rails db:seed
4. Run the full test suite: `rails test:all`

## Test Suite Overview

The project uses the RSpec framework to create easy-to-read test cases covering unit tests, request tests (integration tests), system tests (E2E tests), and a few tests covering email templates and authorization policies.

### Unit tests

Test objects in isolation to ensure they work as expected. The following example declares that a ticket must have a category:
```
it "must have a category" do
  ticket.category = nil
  ticket.valid?

  expect(ticket.errors[:category]).to include("can't be blank")
end
```

### Request (Integration) tests

Tests interactivity between different web pages. The following ensures that when a role is created in the system, the redirection after performing the database transaction loads successfully:
```
describe "create" do
  it "saves successfully" do
    post roles_path(params: { role: { name: "Test role", code: "TST" } })

    follow_redirect!

    expect(response).to have_http_status(:ok)
  end
end
```

### System (E2E) tests

Tests larger behavioural flows. Capybara is used to provide methods to simulate user interactions such as clicking buttons, visiting links etc. Selenium performs the actions. Example snippet:
```
it "must allow a user to post a comment" do
  ...
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
  ...
  fill_in "comment_body", with: "Comment body"
  click_on "Add comment"
  expect(page).to have_text("Comment body")
end
```
## Production

The live application is found at: https://helpingdesk-595b0eb90691.herokuapp.com/users/sign_in

Application login credentials:

**Admin**</br>
Email: admin_bob_walker@example.com</br>
Password: password</br>

*Client user has limited functionality*</br>
**Client**</br>
Email: client_alice_walker@example.com</br>
Password: password
