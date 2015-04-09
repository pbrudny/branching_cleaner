require 'psql_db_tasks'

# Just for mocking database configuration
class Rails

  def self.configuration
    Configuration.new
  end

  class Configuration
    def database_configuration
      { 'development' => development }
    end

    def development
      {
        'adapter' => 'postgresql',
        'encoding' => 'unicode',
        'pool' => 5,
        'username' => 'foouser',
        'password' => 'barpassword',
        'database' => 'my_project_development_feature_branch'
      }
    end
  end
end