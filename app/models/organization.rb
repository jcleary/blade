class Organization < ApplicationRecord
  has_many :users, through: :organization_users
  has_many :projects, dependent: :destroy
end
