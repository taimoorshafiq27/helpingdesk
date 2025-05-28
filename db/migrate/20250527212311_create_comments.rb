class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments, id: :uuid do |t|
      t.string :body
      t.references :ticket, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
