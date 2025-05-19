require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: "Bob", email: "example@example.com") }
end
