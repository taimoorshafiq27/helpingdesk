require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { build(:comment) }

  it "has a valid factory" do
    expect(comment.errors).to be_empty
  end

  it "must have a body" do
    comment.body = nil
    comment.valid?

    expect(comment.errors[:body]).to include("can't be blank")
  end
end
