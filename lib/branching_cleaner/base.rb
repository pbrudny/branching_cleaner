module DatabaseBranchingCleaner

  class Base
    protected

    def current_branch
      `git symbolic-ref HEAD 2>/dev/null`.chomp.sub('refs/heads/', '')
    end

    def switch_to_master_branch
      `git checkout master`
    end
  end

end