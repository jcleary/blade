class AddFailedCountToBuild < ActiveRecord::Migration[5.0]
  def change
    add_column :builds, :failed_count, :integer, default: 0
  end
end
