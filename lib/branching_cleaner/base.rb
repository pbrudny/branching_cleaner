module DatabaseBranchingCleaner

  class Base
    protected

    def current_branch
      `git symbolic-ref HEAD 2>/dev/null`.chomp.sub('refs/heads/', '')
    end

    def switch_to_master_branch
      `git checkout master`
    end

    def configuration
      Rails.configuration.database_configuration['development']
    end

    def db_core_name
      configuration['database'].split("development_#{current_branch}").first
    end

    def connection
      @connection ||= master_connection
    end

    def master_connection
      tasks = ActiveRecord::Tasks::PostgreSQLDatabaseTasks.new(configuration)
      tasks.send 'establish_master_connection'
      tasks.connection
    end
  end

end