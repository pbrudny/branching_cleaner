require 'spec_helper'

describe BranchingCleaner::DatabaseRemover do
  let(:env) { 'development' }
  subject { described_class.new(env) }

  describe '#drop' do
    context 'when branch name is not longer than 63 characters' do
      let(:branch) { 'short_name' }
      it 'drops database' do
        expect_any_instance_of(ActiveRecord::Tasks::PostgreSQLDatabaseTasks)
          .to receive(:connection).and_return(@connection = double('Proxy'))
        expect(@connection).to receive(:drop_database)
        subject.drop(branch)
      end
    end

    context 'when branch name is not longer than 63 characters' do
      let(:branch) { 'long_name' * 10 }
      it 'does nothing' do
        expect_any_instance_of(ActiveRecord::Tasks::PostgreSQLDatabaseTasks).not_to receive(:connection)
        subject.drop(branch)
      end
    end
  end
end