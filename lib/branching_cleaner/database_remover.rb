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

    def db_name(branch)
      "#{db_core_name}#{env}_#{branch}"
    end

  end
end