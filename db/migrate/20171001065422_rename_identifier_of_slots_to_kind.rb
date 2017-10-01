class RenameIdentifierOfSlotsToKind < ActiveRecord::Migration[5.1]
  def change
    rename_column :slots, :identifier, :kind
    change_column :slots, :kind, :integer
  end
end
