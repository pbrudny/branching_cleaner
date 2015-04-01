module DatabaseBranchingCleaner

  class DatabaseRemover < Base

    def initialize(env)
      self.env = env
    end

    def drop(branch)
      database = db_name(branch)
      if database.size < 64
        connection.drop_database(database)
        puts "* Removed '#{database}'"
      else
        puts '* database name was too long'
      end
    end

    private

    attr_accessor :env

    def configuration
      Rails.configuration.database_configuration[env]
    end

    def db_core_name
      configuration['database'].split(current_branch).first
    end

    def db_name(branch)
      "#{db_core_name}#{branch}"
    end

    def connection
      @connection ||= master_connection
    end

    def master_connection
      p = ActiveRecord::Tasks::PostgreSQLDatabaseTasks.new(configuration)
      p.send 'establish_master_connection'
      p.connection
    end
  end
end