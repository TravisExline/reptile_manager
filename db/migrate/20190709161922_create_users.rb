class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table do |t|
      t.string :name
      t.string :email
      t.integer :age
    end
  end
end
