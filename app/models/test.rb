class Test < ApplicationRecord
  belongs_to :project
  has_many :test_runs
  has_many :builds, through: :test_runs

  scope :non_deterministic, -> { where('non_deterministic_count > 0') }
  scope :slowest_first, -> { order(average_duration: :desc) }

  def pass_ratio
    if passed_count + failed_count > 0
      passed_count / (passed_count + failed_count)
    else
      0
    end
  end

  def update_summary
    update(
      average_duration: test_runs.average(:duration),
      passed_count: test_runs.where(status: 'passed').count,
      failed_count: test_runs.where(status: 'failed').count,
      non_deterministic_count: calc_non_deterministic_count
    )
  end

  private 

  def calc_non_deterministic_count
    test_runs.joins(:build).
      where('builds.failed_count < 5').
      where(status: 'failed').count 
  end
end
