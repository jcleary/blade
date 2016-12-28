class Organization < ApplicationRecord
  has_many :projects, dependent: :destroy
end
