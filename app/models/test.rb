class Test < ApplicationRecord
  belongs_to :project
  has_many :test_runs
end
