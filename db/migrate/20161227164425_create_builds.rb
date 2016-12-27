class CreateBuilds < ActiveRecord::Migration[5.0]
  def change
    create_table :builds do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end
