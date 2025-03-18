# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::Extra::FlatExamples, :config do
  it "registers an offense when unnecessary nesting by context" do
    expect_offense(<<~RUBY)
      context 'when condition' do
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^ Unnecessary nesting by example groups detected.
        it 'tests something' do
        end
      end
    RUBY
  end

  it "registers an offense when unnecessary nesting by describe" do
    expect_offense(<<~RUBY)
      describe 'when condition' do
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Unnecessary nesting by example groups detected.
        it 'tests something' do
        end
      end
    RUBY
  end

  it "does not register an offense when flat examples" do
    expect_no_offenses(<<~RUBY)
      it 'tests something when condition' do
      end
    RUBY
  end

  it "does not register an offense when necessary nesting" do
    expect_no_offenses(<<~RUBY)
      context 'when condition' do
        it 'tests something' do
        end

        it 'tests something else' do
        end
      end
    RUBY
  end
end
