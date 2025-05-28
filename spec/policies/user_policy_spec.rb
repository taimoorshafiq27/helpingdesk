require 'rails_helper'

RSpec.describe UserPolicy do
  let(:record) { nil }
  let(:policy) { described_class.new(user, record) } # i.e. described_class is UserPolicy

  context "with administrators and agents" do
    let(:user) { create(:user, :assign_role) }

    it "permits the index, show, edit and update actions" do
      expect(policy).to permit_actions([:index, :show, :edit, :update])
    end

    it "forbids the destroy action" do
      expect(policy).to forbid_actions([:new, :create, :destroy])
    end
  end

  context "with client users" do
    let(:user) { create(:user, :assign_client_role)}

    it "permits the show action" do
      expect(policy).to permit_action(:show)
    end

    it "forbids the index, new, create, edit, update and destroy actions" do
      expect(policy).to forbid_actions([:index, :new, :create, :edit, :update, :destroy])
    end
  end
end