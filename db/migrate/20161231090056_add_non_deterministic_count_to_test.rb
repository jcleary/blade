class AddNonDeterministicCountToTest < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :non_deterministic_count, :integer
  end
end
