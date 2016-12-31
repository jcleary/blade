class AddTestCountToBuild < ActiveRecord::Migration[5.0]
  def change
    add_column :builds, :test_count, :integer, default: 0
    add_column :builds, :duration, :float, default: 0
    add_column :builds, :x_slowest_duration, :float, default: 0
  end
end
