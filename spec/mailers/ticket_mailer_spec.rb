require "rails_helper"

RSpec.describe TicketMailer, type: :mailer do
  let(:user) { create(:user, :assign_client_role) }
  let(:ticket) { build(:ticket, client: user) }

  it "successfully sends an email to the client who created the ticket" do
    ticket.save!

    Rails.application.routes.default_url_options[:host] = 'http://localhost'

    expect {
      TicketMailer.ticket_creation_notification(user, ticket).deliver_now
    }.to change { ActionMailer::Base.deliveries.count }.by(1)
    # Above, the count should change to 1, meaning we can use .first, .last etc. to grab the email object, like below.
    email = ActionMailer::Base.deliveries.first

    expect(email.to).to eq([user.email])
    expect(email.subject).to eq("Your ticket has been created")
    expect(email.from).to eq(["example@example.com"])
  end
end
