class AddVictimToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :victim, :boolean
  end
end
