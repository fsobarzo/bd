class CreateEvidences < ActiveRecord::Migration
  def change
    create_table :evidences do |t|
      t.text :description

      t.timestamps
    end
  end
end
