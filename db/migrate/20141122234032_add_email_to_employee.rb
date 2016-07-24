class AddEmailToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :email, :string
    add_column :employees, :hashed_password, :string
  end
end
