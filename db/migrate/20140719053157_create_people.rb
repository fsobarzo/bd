class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :nombre
      t.integer :edad
      t.string :ocupacion

      t.timestamps
    end
  end
end
