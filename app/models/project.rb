class Project < ApplicationRecord
  belongs_to :organization
  has_many :builds, dependent: :destroy
  has_many :tests, dependent: :destroy

  def non_deterministic_tests
    allowed_builds = Build.where('failed_count < 5').pluck(:id)
    tests.
      joins(:test_runs).
      where('test_runs.build_id': allowed_builds).
      where('test_runs.status': 'failed')
  end
end
