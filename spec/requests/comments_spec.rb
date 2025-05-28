require "rails_helper"

RSpec.describe "Comments", type: :request do
  let(:role) { create(:role) }
  let(:user) { create(:user) }

  before do
    user.roles << role
    sign_in user
  end

  describe "create" do
    it "save succesfully" do
      ticket = create(:ticket, client: user)
      post ticket_comments_path(ticket, comment: attributes_for(:comment))

      follow_redirect!

      expect(response).to have_http_status(:ok)
    end
  end
end