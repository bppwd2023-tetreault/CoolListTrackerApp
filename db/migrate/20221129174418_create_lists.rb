class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :list_type
      t.integer :user_id
      t.boolean :archived

      t.timestamps
    end
  end
end
