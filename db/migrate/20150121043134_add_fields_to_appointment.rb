class AddFieldsToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :p_confirmed, :boolean, default: false #payment confirmed
    add_column :appointments, :notes, :string, default: "N/A" #notes on appointment
    add_column :appointments, :cancelled, :boolean, default: false
    add_column :appointments, :no_show, :boolean, default: false #client/escort don't show
  end
end
