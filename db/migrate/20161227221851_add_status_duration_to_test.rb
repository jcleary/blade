class AddStatusDurationToTest < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :average_duration, :float
    add_column :tests, :passed_count, :integer
    add_column :tests, :failed_count, :integer
  end
end
