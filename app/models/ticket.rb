class Ticket < ApplicationRecord
  belongs_to "client", class_name: "User", foreign_key: "client_id"
  belongs_to "assignee", class_name: "User", foreign_key: "assignee_id", optional: true
end
