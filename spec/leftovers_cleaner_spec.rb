require 'spec_helper'

describe BranchingCleaner::LeftoversCleaner do
  subject { described_class.new }

  describe '#run' do
    let(:connection) { ActiveRecord::Tasks::PostgreSQLDatabaseTasks::Connection }

    it 'switches to master' do
      expect(BranchingCleaner::GIT).to receive(:switch_to_master_branch)
      subject.run
    end

    it 'drops databases' do
      expect_any_instance_of(connection).to receive(:drop_database).with('my_project_test_feature')
      expect_any_instance_of(connection).to receive(:drop_database).with('my_project_development_feature')
      subject.run
    end
  end
end