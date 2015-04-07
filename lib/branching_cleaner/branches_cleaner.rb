module BranchingCleaner

  class BranchesCleaner < Base

    def run
      branches_to_drop_database.each do |branch|
        puts "* Removing: #{branch}"
        BranchCleaner.new(branch).run
      end
    end

    private

    def branches_to_drop_database
      @branches ||= GIT::branches.split - ['master', '*', current_branch]
    end
  end

end