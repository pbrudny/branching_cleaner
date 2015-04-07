module BranchingCleaner

  class GIT

    class << self

      def switch_to_master_branch
        `git checkout master`
      end

      def branches
        `git branch`
      end

      def current_branch
        `git symbolic-ref HEAD 2>/dev/null`.chomp.sub('refs/heads/', '')
      end

      def drop_branch(branch)
        `git branch -D #{branch}`
      end
    end

  end

end