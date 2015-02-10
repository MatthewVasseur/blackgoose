class CreateOnlineBlocks < ActiveRecord::Migration
  def change
    create_table :online_blocks do |t|
      t.integer :day
      t.time :start
      t.time :end
      t.references :escort, index: true

      t.timestamps null: false
    end
    add_foreign_key :online_blocks, :escorts
  end
end
