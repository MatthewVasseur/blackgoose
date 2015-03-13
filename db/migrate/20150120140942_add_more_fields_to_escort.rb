class AddMoreFieldsToEscort < ActiveRecord::Migration
  def change
    add_column :escorts, :price, :integer
    add_column :escorts, :online, :boolean, default:false
    #add_column :escorts, :booked, :boolean, default:false
    #add_column :escorts, :operation_area, :string
  end
end
