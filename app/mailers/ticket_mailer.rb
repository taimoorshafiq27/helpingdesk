class TicketMailer < ApplicationMailer
  default from: "example@example.com"
  layout 'mailer'

  def ticket_creation_notification(user, ticket)
    @user = user
    @ticket = ticket
    @url = ticket_url(@ticket)
    mail(to: @user.email, subject: "Your ticket has been created" )
  end
end
