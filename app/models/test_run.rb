class TestRun < ApplicationRecord
  belongs_to :test
  belongs_to :build

  scope :slowest, -> { order(duration: :desc).limit(10) }
end
