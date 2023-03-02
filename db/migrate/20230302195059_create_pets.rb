class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :pet_type
      t.date :date_of_birth
      t.string :size
      t.string :breed
      t.string :gender
      t.string :hair_length
      t.string :alergies
      t.text :extra_information
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
