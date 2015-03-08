class AddTwoFieldsToEscorts < ActiveRecord::Migration
  def change
    add_column :escorts, :phone, :string
    add_column :escorts, :security, :integer
  end
end
