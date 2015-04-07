require 'spec_helper'

describe BranchingCleaner::BranchesCleaner do
  subject { described_class.new }

  describe '#run' do
    it 'triggers run on Branch Cleaner' do
      expect(BranchingCleaner::BranchCleaner)
        .to receive(:new).with('another_feature_branch').and_return(@cleaner = double('Proxy'))
      expect(@cleaner).to receive(:run)
      subject.run
    end
  end
end