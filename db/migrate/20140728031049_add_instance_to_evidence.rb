class AddInstanceToEvidence < ActiveRecord::Migration
  def change
  	add_column :evidences, :instance_id, :integer
  end
end
