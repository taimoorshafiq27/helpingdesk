require "rails_helper"

RSpec.describe "Roles", type: :request do
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
      post roles_path(role: attributes_for(:role))

      follow_redirect!

      expect(response).to have_http_status(:ok)
    end
  end

  describe "show" do
    it "loads successfully" do
      role = create(:role)
      get role_path(role)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "edit" do
    it "loads successfully" do
      role = create(:role)
      get edit_role_path(role)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "update" do
    it "updates successfully" do
      role = create(:role)
      patch role_path(role, role: { name: "Admin" })

      follow_redirect!

      expect(response).to have_http_status(:ok)
    end
  end

  describe "destroy" do
    it "destroys successfully" do
      role = create(:role)
      delete role_path(role)

      follow_redirect!

      expect(response).to have_http_status(:ok)
    end
  end
end
