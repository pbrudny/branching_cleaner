module ActiveRecord
  module Tasks

    class PostgreSQLDatabaseTasks

      def initialize(configuration)
        @configuration = configuration
      end

      def connection
        Connection.new
      end

      private

      def establish_master_connection
        true
      end

      class Connection
        def drop_database(database)
          true
        end
      end

    end

  end
end