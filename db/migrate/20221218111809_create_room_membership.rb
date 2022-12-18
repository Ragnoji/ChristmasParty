class CreateRoomMembership < ActiveRecord::Migration[6.1]
  def change
    create_table :room_memberships do |t|
      t.belongs_to :room
      t.belongs_to :user
      t.string :role, null: true

      t.timestamps
    end
  end
end
