class Ticket < ApplicationRecord
  belongs_to :client, class_name: "User", foreign_key: "client_id"
  belongs_to :assignee, class_name: "User", foreign_key: "assignee_id", optional: true

  has_many :comments
  accepts_nested_attributes_for :comments

  enum category: { computer: 0, internet: 1, video: 2, email: 3, printers: 4, misc: 5 }
  enum status: { open: 0, resolved: 1 }

  validates :title, :description, :category, :status, presence: true
end
