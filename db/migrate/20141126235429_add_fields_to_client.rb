class AddFieldsToClient < ActiveRecord::Migration
  def change
    add_column :clients, :name, :string
    add_column :clients, :dob, :date
    #address columns
    add_column :clients, :line1, :string
    add_column :clients, :city, :string
    add_column :clients, :state, :string
    add_column :clients, :zip, :string
  end
end
