require 'spec_helper'

describe BranchingCleaner::LeftoversCleaner do
  subject { described_class.new }

  describe '#run' do
    it 'switches to master' do
      expect(BranchingCleaner::GIT).to receive(:switch_to_master_branch)
      subject.run
    end

    it 'returns databases' do
      expect_any_instance_of(ActiveRecord::Tasks::PostgreSQLDatabaseTasks)
          .to receive(:connection).and_return(@connection = double('Proxy'))
      expect(@connection).to receive(:query)
      subject.run
    end
  end
end