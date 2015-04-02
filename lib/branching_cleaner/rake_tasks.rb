namespace :db do
  desc 'Remove all development and test databases associated with Git branches'
  task :clean_branches => :environment do
    puts 'Removing development and test databases associated to branches (except master)'
    DatabaseBranchingCleaner::Multiple.new.run
    puts 'Databases removed'
  end

  desc 'Remove git branch with a database'
  task :drop_branch => :environment do
    DatabaseBranchingCleaner::Single.new.drop_current
  end

  desc 'Remove all development and test databases remaining after removing Git branches'
  task :drop_leftovers => :environment do
    DatabaseBranchingCleaner::LeftOvers.new.run
  end
end
