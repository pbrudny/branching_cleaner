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

        def query(sql)
          [['my_project_development_feature'], ['my_project_test_feature'], ['my_project_development_feature_2']]
        end
      end

    end

  end
end