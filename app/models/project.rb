class Project < ApplicationRecord
  belongs_to :organization
  has_many :builds, dependent: :destroy
  has_many :tests, dependent: :destroy
end
