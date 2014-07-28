class AddDefaultToGuest < ActiveRecord::Migration
  def change
  	change_column :guests, :victim, :boolean, :default => false
  end
end
