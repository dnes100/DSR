class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.date :date
      t.integer :employee_id
      t.text :task
      t.string :task_status

      t.timestamps
    end
  end
end
