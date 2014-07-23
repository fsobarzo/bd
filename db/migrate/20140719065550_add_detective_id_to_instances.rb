class AddDetectiveIdToInstances < ActiveRecord::Migration
  def change
  	add_column :instances, :detective_id, :string
  end
end
