class LinkEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :uid, :string
  end
end
