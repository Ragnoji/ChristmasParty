class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :date_of_birth, :datetime, null: false
    add_column :users, :gender, :string, null: false, default: "not chosen"
    add_column :users, :description, :text, null: true
  end
end
