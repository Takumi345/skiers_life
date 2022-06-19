class AddIsRegistrationToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :is_registration, :boolean, default: false
  end
end
