class CreateDataPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :data_points do |t|
      t.integer :type
      t.float :value
      t.references :room, foreign_key: true
      t.references :node, foreign_key: true

      t.timestamps
    end
  end
end
