class AddStateToInstance < ActiveRecord::Migration
  def change
    add_column :instances, :state, :boolean, :default => 0
  end
end
