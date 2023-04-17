# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::Extra::RestrictBlockTag, :config do
  context "when AllowTags: ['bar', 'qux']" do
    let(:cop_config) { { "AllowTags" => %w[bar qux] } }

    it "registers an offense when using not allowed tags" do
      expect_offense(<<~RUBY)
        RSpec.describe 'Something', :foo, :bar, :baz, :qux do
                                                ^^^^ This tag is not allowed. Allowed tags: bar, qux.
                                    ^^^^ This tag is not allowed. Allowed tags: bar, qux.
        end
      RUBY
    end

    it "register an offense when using allowed tags pair" do
      expect_offense(<<~RUBY)
        RSpec.describe 'Something', :qux, foo: :bar do
                                          ^^^ This tag is not allowed. Allowed tags: bar, qux.
        end
      RUBY
    end

    it "does not register an offense when using allowed tags" do
      expect_no_offenses(<<~RUBY)
        RSpec.describe 'Something', :bar, :qux do
        end
      RUBY
    end
  end

  context "when AllowTags: []" do
    let(:cop_config) { { "AllowTags" => [] } }

    it "registers an offense when using tags" do
      expect_offense(<<~RUBY)
        RSpec.describe 'Something', :foo, bar: baz do
                                    ^^^^ Tags are not allowed.
                                          ^^^ Tags are not allowed.
        end
      RUBY
    end

    it "does not register an offense when not using tags" do
      expect_no_offenses(<<~RUBY)
        RSpec.describe 'Something' do
        end
      RUBY
    end
  end
end
