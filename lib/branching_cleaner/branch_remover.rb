module DatabaseBranchingCleaner

  class BranchRemover < Base

    def drop_current
      branch = current_branch
      drop_db(branch)
      switch_to_master_branch
      drop_branch(branch)
    end

    def drop(branch)
      drop_db(branch)
      drop_branch(branch)
    end

    private

    attr_accessor :branch

    def drop_db(branch)
      BranchCleaner.new(branch).run
    end

    def drop_branch(branch)
      `git branch -D #{branch}`
      puts "Branch '#{branch}' removed"
    end
  end

end