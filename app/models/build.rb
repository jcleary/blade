class Build < ApplicationRecord
  belongs_to :project
  has_many :test_runs, dependent: :destroy

  def total_duration
    test_runs.sum(:duration)
  end

end

