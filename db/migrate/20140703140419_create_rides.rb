class CreateRides < ActiveRecord::Migration
  # Write your migrations here
  create_table :rides do |f|
    f.integer :user_id
    f.integer :attraction_id
  end
end
