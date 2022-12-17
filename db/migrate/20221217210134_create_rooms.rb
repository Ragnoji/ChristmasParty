class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.text :description
      t.datetime :deadline_at, null: false
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
