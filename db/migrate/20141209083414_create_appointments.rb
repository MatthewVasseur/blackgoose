class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      # appointment info
      t.datetime :time
      t.string :location
      t.integer :price

      # confirmed
      t.boolean :c_confirmed, default: false #client confirmed
      t.boolean :e_confirmed, default: false #escort confirmed

      t.belongs_to :escort, index: true
      t.belongs_to :client, index: true

      t.timestamps
    end
  end
end
