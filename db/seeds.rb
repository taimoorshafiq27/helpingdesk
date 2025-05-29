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

admin_bob_walker = User.create!(first_name: "Bob", last_name: "Walker", email: "admin_bob_walker@example.com", password: "password", password_confirmation: "password")
client_alice_walker = User.create!(first_name: "Alice", last_name: "Walker", email: "client_alice_walker@example.com", password: "password", password_confirmation: "password")
client_wesker_aran = User.create!(first_name: "Wesker", last_name: "Aran", email: "wesker_aran@example.com", password: "password", password_confirmation: "password")

admin_bob_walker.roles << admin_role
client_alice_walker.roles << client_role
client_wesker_aran.roles << client_role

15.times do
  Ticket.create!(
    assignee: admin_bob_walker,
    client: [client_alice_walker, client_wesker_aran].sample,
    title: Faker::Book.title,
    description: Faker::Quote.famous_last_words + " " * 15,
    category: :email,
    status: :open)
end