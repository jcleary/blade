class CreateOrganizationUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_users do |t|
      t.integer :organization_id
      t.integer :user_id
    end
  end
end
