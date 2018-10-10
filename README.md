# OkComputer::Clamav

Monitor `clamd` from the luxury of your existing [OkComputer](https://github.com/sportngin/okcomputer/) setup!

This check will make noise when the daemon does not respond to messages. It
makes a socket connection, sends a PING and waits for a PONG. If any of that
does not occur, you'll know it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ok_computer-clamav'
```

And then execute:

    $ bundle

## Usage

In `config/initializers/ok_computer.rb`:

``` ruby
OkComputer::Registry.register "clamd", OkComputer::Clamav::ClamdCheck.new
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/spacebabies/ok_computer-clamav.
