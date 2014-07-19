class AddStateToInstance < ActiveRecord::Migration
  def change
    add_column :instances, :state, :bool, :default => false
  end
end
