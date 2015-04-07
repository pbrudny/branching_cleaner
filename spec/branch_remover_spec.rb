require 'spec_helper'

describe BranchingCleaner::BranchRemover do
  subject { described_class.new }

  describe '#drop_current' do
    it 'triggers branch cleaner' do
      expect_any_instance_of(BranchingCleaner::BranchCleaner).to receive(:run)
      subject.drop_current
    end

    it 'switches to master' do
      expect(BranchingCleaner::GIT).to receive(:switch_to_master_branch)
      subject.drop_current
    end

    it 'drops branch' do
      expect(BranchingCleaner::GIT).to receive(:drop_branch)
      subject.drop_current
    end

  end
end