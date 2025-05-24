require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { build(:ticket, client: create(:user)) }

  describe "validations" do
    it "has a valid factory" do
      ticket.valid?

      expect(ticket.errors).to be_empty
    end

    it "must have a title" do
      ticket.title = nil
      ticket.valid?

      expect(ticket.errors[:title]).to include("can't be blank")
    end

    it "must have a description" do
      ticket.description = nil
      ticket.valid?

      expect(ticket.errors[:description]).to include("can't be blank")
    end

    it "must have a category" do
      ticket.category = nil
      ticket.valid?

      expect(ticket.errors[:category]).to include("can't be blank")
    end

    it "must have an integer type for category value" do
      expect(Ticket.columns_hash["category"].type).to eq(:integer)
    end

    it "must have a status" do
      ticket.status = nil
      ticket.valid?

      expect(ticket.errors[:status]).to include("can't be blank")
    end

    it "must have an integer type for status value" do
      expect(Ticket.columns_hash["status"].type).to eq(:integer)
    end
  end
end