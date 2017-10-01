class AddEnabledToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :enabled, :boolean
  end
end
