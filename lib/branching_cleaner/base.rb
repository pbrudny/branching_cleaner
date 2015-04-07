require_relative 'git'

module BranchingCleaner

  class Base

    protected

    def current_branch
      GIT::current_branch
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