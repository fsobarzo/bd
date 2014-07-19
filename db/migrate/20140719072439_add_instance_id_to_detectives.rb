class AddInstanceIdToDetectives < ActiveRecord::Migration
  def change
  	add_column :detectives, :instance_id, :string
  end
end
