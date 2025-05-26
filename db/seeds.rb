# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
admin_role = Role.find_or_create_by(name: "Administrator", code: "ADM")
Role.find_or_create_by(name: "Agent", code: "AGT")
client_role = Role.find_or_create_by(name: "Client", code: "CLT")

admin_user = User.create!(first_name: "Bob", last_name: "Walker", email: "admin@example.com", password: "password", password_confirmation: "password")
client_user = User.create!(first_name: "Alice", last_name: "Walker", email: "client@example.com", password: "password", password_confirmation: "password")

admin_user.roles << admin_role
client_user.roles << client_role

15.times do |n|
  Ticket.create!(assignee: admin_user, client: client_user, title: "Ticket #{n + 1}", description: "This is a seeded description for a ticket.", category: :email, status: :open)
end