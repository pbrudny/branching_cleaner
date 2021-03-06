require 'coveralls'
Coveralls.wear!
require 'pry'
require 'branching_cleaner'
require 'rails'
require 'git_mock'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
  config.before(:all) do
    @before_all = "before all"
  end
end