# EasyOptParser (EOP)

Easy Opt Parser is a small simplification of the class `OptParser`.

The objective of this gem is to make easier the way to create command line options for your command. This gem is using the basic of OptParser and can be expanded over time.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_opt_parser'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install easy_opt_parser

## Usage

Let's see how it works!

Create a `dir` where you want and inside create two files:

`Gemfile` and `test.rb` 

Inside `Gemfile`

```ruby
gem 'easy_opt_parser'
```

Then run

```bash
bundle install
```

Inside `test.rb` write this code

```ruby
require 'easy_opt_parser'
require 'easy_opt_parser/domain/optional_argument'
require 'easy_opt_parser/domain/required_argument'
require 'easy_opt_parser/domain/flag_argument'

def arguments
  [
      EOP::RequiredArgument.new(name: 'required',
                                short_option: '-r',
                                long_option: '--required',
                                description: 'This is a required argument'),

      EOP::OptionalArgument.new(name: 'optional',
                                short_option: '-o',
                                long_option: '--optional',
                                description: 'This is an optional argument'),

      EOP::FlagArgument.new(name: 'flag',
                            short_option: '-f',
                            long_option: '--flag',
                            description: 'This is a flag argument'),
  ]
end


parser = EasyOptionParser.new('Test Arguments', arguments)

puts parser.options
```

This code shows that the only thing we need to do is to create an `Array` of `RequiredArgumen`, `OptionalArgumen` or `FlagArgument`.

`RequiredArgument`: In the help description will be added a `*` symbol to determinate that is required. Also the gem will check all required arguments to be present and with values, if not an exception will be raised.

`OptionalArgument`: Not necessary to be in command line, default value will be `nil`. If the argument is present but without value and error will be raised.

`FlagArgument`: Not necessary to be in command line, default value will be `false`. If the flag appears the value will be `true`

An extra argument is automatically added `-h` and `--help` to display the different arguments.

## Examples

Using the `Usage` example lets see the output the diffent outputs.

`help` argument

```bash
bundle exec ruby test.rb -h
```

Output

```bash
Test Arguments
    -r, --required required          This is a required argument *
    -o, --optional optional          This is an optional argument
    -f, --flag                       This is a flag argument
    -h, --help                       Displays Help
```

`required` argument

```bash
bundle exec ruby test.rb
```

Output

```bash
 Missing Argument [required] (RuntimeError)
```

`required` is obviously a required argument, so the system will raise an error in this case 

```bash
bundle exec ruby test.rb -r myValue
```

Output

```bash
 {:required=>"myValue", :optional=>nil, :flag=>false}
```

`optional` argument

```bash
bundle exec ruby test.rb -r myValue -o myOptionalValue
```

Output

```bash
 {:required=>"myValue", :optional=>"myOptionalValue", :flag=>false}
```

`flag` argument

```bash
bundle exec ruby test.rb -r myValue -f
```

Output

```bash
 {:required=>"myValue", :optional=>nil, :flag=>true}
```

## Development

After checking out the repository run

```bash
bundle install
```

And then run the tests to check that everything is working as expected.

```bash
ruby tests/test_easy_options_parser.rb 
```

Remember if you are contributing, create and run the tests before pull request.

## Contributing

Bug reports and pull requests are welcome on Gitlab at [https://gitlab.com/gonzalez.martin90/easy-option-parser](https://gitlab.com/gonzalez.martin90/easy-option-parser). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EasyOptParser project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/easy_opt_parser/blob/master/CODE_OF_CONDUCT.md).
