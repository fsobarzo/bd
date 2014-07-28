class AddNameToDetectives < ActiveRecord::Migration
  def change
  	add_column :detectives, :name, :string
  	add_column :detectives, :lastname, :string
  end
end
