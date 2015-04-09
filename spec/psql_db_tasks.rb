module ActiveRecord
  module Tasks

    class PostgreSQLDatabaseTasks
      class Connection
        def drop_database(database)
          true
        end

        def query(sql)
          [['my_project_development_feature'], ['my_project_test_feature'], ['another_development_feature']]
        end
      end

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
    end
  end
end