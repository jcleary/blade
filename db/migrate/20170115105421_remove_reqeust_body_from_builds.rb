class RemoveReqeustBodyFromBuilds < ActiveRecord::Migration[5.0]
  def change
    remove_column :builds, :request_body
  end
end
