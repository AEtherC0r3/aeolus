class RenameTypeToKind < ActiveRecord::Migration[5.1]
  def change
    rename_column :targets, :type, :kind
    rename_column :data_points, :type, :kind
    rename_column :climate_control_units, :type, :kind
  end
end
