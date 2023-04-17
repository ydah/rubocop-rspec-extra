# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::Extra::RestrictBlockTagValue, :config do
  context "when AllowTagValues: { foo: 'bar' }" do
    let(:cop_config) { { "AllowTagValues" => { "foo" => "bar" } } }

    it "registers an offense when using not allowed tag values" do
      expect_offense(<<~RUBY)
        RSpec.describe 'Something', foo: :bar, foo: :baz, foo: :qux do
                                               ^^^^^^^^^ This value is not allowed in this tag. Allowed tag value: bar.
                                                          ^^^^^^^^^ This value is not allowed in this tag. Allowed tag value: bar.
        end
      RUBY
    end
  end

  context "when AllowTagValues: {}" do
    let(:cop_config) { { "AllowTagValues" => {} } }

    it "does not register an offense" do
      expect_no_offenses(<<~RUBY)
        RSpec.describe 'Something', foo: :bar do
        end
      RUBY
    end
  end
end
