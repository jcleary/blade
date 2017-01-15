class Build < ApplicationRecord
  belongs_to :project
  has_many :test_runs, dependent: :destroy

  def process_test_runs(new_test_runs)
    test_runs.destroy_all
    new_test_runs.each do |test_run|
      add_test_run(test_run)
    end
    update_summary
  end

  def update_summary
    update(
      failed_count: test_runs.where(status: 'failed').count,
      duration: test_runs.sum(:duration),
      test_count: test_runs.count,
      x_slowest_duration: test_runs.slowest.pluck(:duration).compact.sum
    )
  end

  def add_test_run(example)
    test = find_or_create_test(example)
    TestRun.create(
      build: self,
      test: test,
      status: example['status'],
      duration: example['run_time']
    )
    test.update_summary
  end

  def find_or_create_test(example)
    test = project.tests.find_or_create_by(
      name: example['description'],
      description: example['full_description']
    )
    test.update(
      file_path: example['file_path'],
      line_number: example['line_number']
    )
    test
  end

end

