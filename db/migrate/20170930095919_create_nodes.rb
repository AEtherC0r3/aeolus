class CreateNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|
      t.integer :capabilities
      t.string :api_key
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
