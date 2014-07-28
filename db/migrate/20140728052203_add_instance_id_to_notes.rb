class AddInstanceIdToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :instance_id, :integer
  end
end
