require "bundler/gem_tasks"
require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

require 'rubocop'

# Maybe it doesn't work
desc 'Generate a new cop template'
task :new_cop, [:cop] do |_task, args|
  p args
  require 'pry'
  binding.pry
  cop_name = args.fetch(:cop) do
    raise ArgumentError, 'One argument is required'
  end

  generator = RuboCop::Cop::Generator.new(cop_name)

  generator.write_source
  generator.write_spec
  generator.inject_require

  puts generator.todo
end
