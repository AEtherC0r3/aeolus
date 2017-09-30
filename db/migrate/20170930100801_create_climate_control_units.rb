class CreateClimateControlUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :climate_control_units do |t|
      t.string :name
      t.integer :type
      t.references :room, foreign_key: true
      t.references :slot, foreign_key: true

      t.timestamps
    end
  end
end
