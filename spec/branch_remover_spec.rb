require 'spec_helper'
require 'branching_cleaner'

describe BranchRemover do
  subject { described_class.new }

  describe '#drop_current' do

    it 'triggers branch cleaner' do
      expect(BranchCleaner).to receive(:new).and_call_original
    end
  end
end