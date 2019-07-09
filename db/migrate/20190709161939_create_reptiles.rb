class CreateReptiles < ActiveRecord::Migration[5.2]
  def change
    create_table :reptiles do |t|
      t.string :name
      t.integer :age
      t.string :species
      t.string :morph
    end
  end
end
