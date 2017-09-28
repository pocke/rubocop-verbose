# frozen_string_literal: true

describe RuboCop::Cop::Lint::RequireInMethod do
  let(:config) { RuboCop::Config.new }
  subject(:cop) { described_class.new(config) }

  it 'registers an offense for `require` in method definition' do
    expect_offense(<<-RUBY.strip_indent)
      def foo
        require 'bar'
        ^^^^^^^^^^^^^ Do not use `require` in method.
      end
    RUBY
  end

  it 'does not register an offense for `require` out of method definition' do
    expect_no_offenses(<<-RUBY.strip_indent)
      require 'foo'
    RUBY
  end
end
