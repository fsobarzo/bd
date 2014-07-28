class AddInstanceIdToGuests < ActiveRecord::Migration
  def change
  	add_column :guests, :instance_id, :integer
  end
end
