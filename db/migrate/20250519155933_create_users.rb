class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, default: ""
      t.string :phone

      t.timestamps
    end
  end
end
