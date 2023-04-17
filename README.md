# Rubocop::Rspec::Extra

A RuboCop extension focused on enforcing RSpec. A place where no one is officially employed, but where useful cops can gather.

## Installation

Just install the `rubocop-rspec-extra` gem

```bash
gem install rubocop-rspec-extra
```

or if you use bundler put this in your `Gemfile`

```bash
gem 'rubocop-rspec-extra', require: false
```

## Usage

You need to tell RuboCop to load the RSpec Extra extension. There are two
ways to do this:

### RuboCop configuration file

Put this into your `.rubocop.yml`.

```yaml
require: rubocop-rspec-extra
```

Alternatively, use the following array notation when specifying multiple extensions.

```yaml
require:
  - rubocop-rspec
  - rubocop-rspec-extra
```

Now you can run `rubocop` and it will automatically load the RuboCop RSpec Extra
cops together with the standard cops.

### Command line

```bash
rubocop --require rubocop-rspec-extra
```

### Rake task

```ruby
RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rspec-extra'
end
```

## The Cops

All cops are located under
[`lib/rubocop/cop/rspec/extra`](lib/rubocop/cop/rspec/extra), and contain
examples/documentation.

In your `.rubocop.yml`, you may treat the Committee cops just like any other
cop. For example:

```yaml
RSpec/Extra/RestrictBlockTag:
  Exclude:
    - spec/my_poorly_named_spec_file.rb
```

## Contributing

Checkout the [contribution guidelines](.github/CONTRIBUTING.md).

## License

`rubocop-committee` is MIT licensed. [See the accompanying file](MIT-LICENSE.md) for
the full text.
