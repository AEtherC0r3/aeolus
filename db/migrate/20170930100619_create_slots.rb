class CreateSlots < ActiveRecord::Migration[5.1]
  def change
    create_table :slots do |t|
      t.string :identifier
      t.references :node, foreign_key: true
      t.references :climate_control_unit, foreign_key: true

      t.timestamps
    end
  end
end
