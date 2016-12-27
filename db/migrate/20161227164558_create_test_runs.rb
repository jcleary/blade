class CreateTestRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :test_runs do |t|
      t.integer :test_id
      t.integer :build_id
      t.string :status
      t.float :duration

      t.timestamps
    end
  end
end
