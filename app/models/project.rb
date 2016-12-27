class Project < ApplicationRecord
  belongs_to :organization
  has_many :builds
  has_many :tests
end
