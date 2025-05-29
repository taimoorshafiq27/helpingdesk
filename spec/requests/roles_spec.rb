require "rails_helper"

RSpec.describe "Roles", type: :request do
  let(:role) { create(:role) }
  let(:user) { create(:user) }

  before do
    user.roles << role
    sign_in user
  end

  describe "index" do
    it "loads successfully" do
      get roles_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "new" do
    it "loads successfully" do
      get new_role_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "create" do
    it "saves successfully" do
      post roles_path(params: { role: { name: "Test role", code: "TST" } })

      follow_redirect!

      expect(response).to have_http_status(:ok)
    end
  end

  describe "show" do
    it "loads successfully" do
      get role_path(role)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "edit" do
    it "loads successfully" do
      get edit_role_path(role)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "update" do
    it "updates successfully" do
      patch role_path(role, params: { role: { name: "Admin" }} )

      follow_redirect!

      expect(response).to have_http_status(:ok)
    end
  end

  # NOTE: Currently do not have a destroy route. Comment out for now instead of removing
  # describe "destroy" do
  #   it "destroys successfully" do
  #     delete role_path(role)

  #     follow_redirect!

  #     expect(response).to have_http_status(:ok)
  #   end
  # end
end
