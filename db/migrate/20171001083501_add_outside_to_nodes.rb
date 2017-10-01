class AddOutsideToNodes < ActiveRecord::Migration[5.1]
  def change
    add_column :nodes, :outside, :boolean
  end
end
