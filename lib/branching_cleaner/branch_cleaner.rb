module BranchingCleaner

  class BranchCleaner < Base
    def initialize(branch)
      self.branch = branch
    end

    def run
      %w(development test).each { |env| DatabaseRemover.new(env).drop(branch) }
    end

    private

    attr_accessor :branch
  end
end