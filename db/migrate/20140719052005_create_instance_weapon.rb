class CreateInstanceWeapon < ActiveRecord::Migration
  def change
    create_table :instance_weapons, id: false do |t|
    	t.belongs_to :instance	
      t.belongs_to :weapon
    end
  end
end
