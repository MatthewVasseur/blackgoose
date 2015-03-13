class AddTwoFieldsToEscorts < ActiveRecord::Migration
  def change
    add_column :escorts, :phone, :string
    add_column :escorts, :security, :integer, default: 0
  end
end
