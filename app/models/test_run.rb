class TestRun < ApplicationRecord
  belongs_to :test
  belongs_to :build
end
