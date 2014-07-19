class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.string :name
      t.string :victim
      t.datetime :date
      t.string :place
      t.text :description

      t.timestamps
    end
  end
end
