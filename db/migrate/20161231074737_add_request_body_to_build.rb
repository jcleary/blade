class AddRequestBodyToBuild < ActiveRecord::Migration[5.0]
  def change
    add_column :builds, :request_body, :text, limit: 4294967295
  end
end
