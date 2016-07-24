class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :level_id
      t.string :level_name

      t.timestamps
    end
  end
end
