require 'spec_helper'

describe BranchingCleaner::BranchCleaner do
  let(:branch) { 'my_feature' }
  subject { described_class.new(branch) }

  describe '#run' do
    it 'instantiate database remover for test and development env' do
      expect(BranchingCleaner::DatabaseRemover).to receive(:new).with('development').and_call_original
      expect(BranchingCleaner::DatabaseRemover).to receive(:new).with('test').and_call_original
      subject.run
    end
  end
end