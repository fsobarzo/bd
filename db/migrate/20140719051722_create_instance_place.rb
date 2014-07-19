class CreateInstancePlace < ActiveRecord::Migration
  def change
    create_table :instances_places, id: false do |t|
      t.belongs_to :instance
      t.belongs_to :place
    end
  end
end
