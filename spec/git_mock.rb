module BranchingCleaner

  class GIT

    class << self

      def switch_to_master_branch
        true
      end

      def branches
        'feature_branch another_feature_branch'
      end

      def current_branch
        'feature_branch'
      end

      def drop_branch(branch)
        true
      end
    end

  end

end