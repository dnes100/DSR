class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :employee_id
      t.string :employee_name
      t.integer :level

      t.timestamps
    end
  end
end
