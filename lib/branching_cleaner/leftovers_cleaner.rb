module BranchingCleaner

  class LeftoversCleaner < Base

    def run
      GIT::switch_to_master_branch
      databases_to_remove.each do |database|
        puts "* Removing '#{database}'"
        connection.drop_database(database)
      end
    end

    def databases_to_remove
      databases_except_master('test') + databases_except_master('development')
    end

    def databases_except_master(env)
      all_project_databases(env) - ["#{db_core_name}#{env}_master"]
    end

    def all_project_databases(env)
      all_databases_from_server.select { |database| database.match(/#{db_core_name}#{env}_/)}
    end

    def all_databases_from_server
      connection.query('SELECT datname FROM pg_catalog.pg_database').flatten
    end
  end

end