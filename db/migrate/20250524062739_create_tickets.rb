class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets, id: :uuid do |t|
      t.references :client, type: :uuid, foreign_key: { to_table: :users }
      t.references :assignee, type: :uuid, foreign_key: { to_table: :users }
      t.string :title
      t.string :description
      t.integer :category
      t.integer :status

      t.timestamps
    end
  end
end
