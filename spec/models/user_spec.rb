require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    let(:user) { build(:user) }

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

    it "must have a first name shorter than 30 characters" do
      user.first_name = "a" * 31
      user.valid?

      expect(user.errors[:first_name]).to include("is too long (maximum is 30 characters)")
    end

    it "must have a last name shorter than 30 characters" do
      user.last_name = "a" * 31
      user.valid?

      expect(user.errors[:last_name]).to include("is too long (maximum is 30 characters)")
    end
  end
end
