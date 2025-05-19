require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    let(:user) { User.new(first_name: "Bob", last_name: "Page", email: "example@example.com") }

    it "must have a first name" do
      user.first_name = nil
      user.valid?

      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "must have a last name" do
      user.last_name = nil
      user.valid?

      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "must have an email" do
      user.email = nil
      user.valid?

      expect(user.errors[:email]).to include("can't be blank")
    end
  end
end
