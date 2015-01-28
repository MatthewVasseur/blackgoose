class AddBookedToEscorts < ActiveRecord::Migration
  def change
    add_column :escorts, :booked, :boolean, default:false
  end
end
