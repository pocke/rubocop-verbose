require 'pathname'
require 'yaml'

require 'rubocop'

require 'rubocop/verbose'
require 'rubocop/verbose/version'
require 'rubocop/verbose/inject'

RuboCop::Verbose::Inject.defaults!

require 'rubocop/cop/lint/require_in_method'
