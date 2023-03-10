class CreatePetRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :pet_rooms do |t|
      t.string :name
      t.string :type_of_pet
      t.string :max_size_accepted
      t.integer :rating, array: true, default: [0]
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
