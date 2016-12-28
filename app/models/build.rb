class Build < ApplicationRecord
  belongs_to :project
  has_many :test_runs

  def total_duration
    test_runs.sum(:duration)
  end

end

