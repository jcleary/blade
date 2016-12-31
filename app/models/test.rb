class Test < ApplicationRecord
  belongs_to :project
  has_many :test_runs

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
        failed_count: test_runs.where(status: 'failed').count
      )
  end
end
