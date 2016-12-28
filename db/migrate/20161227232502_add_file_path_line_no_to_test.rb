class AddFilePathLineNoToTest < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :file_path, :string
    add_column :tests, :line_number, :integer
  end
end
