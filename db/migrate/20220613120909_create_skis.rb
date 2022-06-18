class CreateSkis < ActiveRecord::Migration[6.1]
  def change
    create_table :skis do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :title,null: false
      t.text :body,null: false

      t.timestamps
    end
  end
end
