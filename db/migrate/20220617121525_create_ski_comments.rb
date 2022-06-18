class CreateSkiComments < ActiveRecord::Migration[6.1]
  def change
    create_table :ski_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :ski_id

      t.timestamps
    end
  end
end
