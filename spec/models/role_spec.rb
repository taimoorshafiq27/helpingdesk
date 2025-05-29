require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { build(:role) }

  it "has a valid factory" do
    role.valid?

    expect(role.errors).to be_empty
  end

  it "must have a name" do
    role.name = nil
    role.valid?

    expect(role.errors[:name]).to include("can't be blank")
  end

  it "must have a unique name" do
    role.save!
    duplicate_role = build(:role)
    duplicate_role.valid?

    expect(duplicate_role.errors[:name]).to include("has already been taken")
  end

  it "must have a code" do
    role.code = nil
    role.valid?

    expect(role.errors[:code]).to include("can't be blank")
  end

  it "must have a code length of 3 characters" do
    role.code = "ABCD"
    role.valid?

    expect(role.errors[:code]).to include("is the wrong length (should be 3 characters)")
  end

  it "must have a unique code" do
    role.save!
    duplicate_role = build(:role)
    duplicate_role.valid?

    expect(duplicate_role.errors[:code]).to include("has already been taken")
  end
end
