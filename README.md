# BranchingCleaner

[![Build Status](https://travis-ci.org/pbrudny/branching_cleaner.svg)](https://travis-ci.org/pbrudny/branching_cleaner) [![Gem Version](https://badge.fury.io/rb/branching_cleaner.png)](http://badge.fury.io/rb/branching_cleaner) [![Coverage Status](https://coveralls.io/repos/pbrudny/branching_cleaner/badge.svg)](https://coveralls.io/r/pbrudny/branching_cleaner)

[WIP] If you do database branching the biggest problem you might have is enormous amount of useless databases.
The purpose of this gem is to clean that mess.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'branching_cleaner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install branching_cleaner

## Usage

Remove git branch with a database

    rake db:drop_branch

Remove all development and test databases associated with Git branches

    rake db:clean_branches

Remove all development and test databases remaining after removing Git branches

    rake db:drop_leftovers


## Contributing

1. Fork it ( https://github.com/pbrudny/branching_cleaner/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
