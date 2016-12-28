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
end
