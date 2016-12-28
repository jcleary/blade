class ChangeDescriptionColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :tests, :description, :text
  end
end
