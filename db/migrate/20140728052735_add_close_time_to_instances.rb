class AddCloseTimeToInstances < ActiveRecord::Migration
  def change
    add_column :instances, :date_close, :datetime
  end
end
