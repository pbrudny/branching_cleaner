module DatabaseBranchingCleaner

  class LeftoversCleaner < Base

    def run
      switch_to_master_branch
      databases_to_remove.each do |database|
        puts "* Removing '#{database}'"
        connection.drop_database(database)
      end
    end

    def databases_to_remove
      databases_except_master('test') + databases_except_master('development')
    end

    def databases_except_master(env)
      all_project_databases(env) - ["#{db_core_name}_#{env}_master"]
    end

    def all_project_databases(env)
      all_databases_from_server.select { |database| database.match(/#{db_core_name}#{env}_/)}
    end

    def all_databases_from_server
      @databases ||= connection.query('SELECT datname FROM pg_catalog.pg_database').flatten
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
      p = ActiveRecord::Tasks::PostgreSQLDatabaseTasks.new(configuration)
      p.send 'establish_master_connection'
      p.connection
    end
  end

end