require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "index" do
    it "loads successfully" do
      get tickets_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "new" do
    it "loads successfully" do
      get new_ticket_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "create" do
    it "saves successfully" do
      post tickets_path(ticket: attributes_for(:ticket).merge(client_id: user.id))

      follow_redirect!

      expect(response).to have_http_status(:ok)
    end
  end

  describe "show" do
    it "loads successfully" do
      ticket = create(:ticket, client: user)
      get ticket_path(ticket)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "edit" do
    it "loads successfully" do
      ticket = create(:ticket, client: user)
      get ticket_path(ticket)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "update" do
    it "updates successfully" do
      ticket = create(:ticket, client: user)
      patch ticket_path(ticket, params: { ticket: { description: "Updated description" }} )

      follow_redirect!

      expect(response).to have_http_status(:ok)
    end
  end

  # NOTE: Currently do not have a destroy route. Comment out for now instead of removing
  # describe "destroy" do
  #   it "destroys successfully" do
  #     ticket = create(:ticket, client: user)
  #     delete ticket_path(ticket)

  #     follow_redirect!

  #     expect(response).to have_http_status(:ok)
  #   end
  # end
end
