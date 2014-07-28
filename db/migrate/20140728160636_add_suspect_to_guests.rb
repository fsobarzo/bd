class AddSuspectToGuests < ActiveRecord::Migration
  def change
  	add_column :guests, :suspect, :boolean, :default => 0
  end
end
