require 'easy_opt_parser/domain/optional_argument'
require 'easy_opt_parser/domain/required_argument'
require 'easy_opt_parser/domain/flag_argument'
require 'easy_opt_parser'

def given_a_required_option
  EOP::RequiredArgument.new(name: 'path', short_option: '-p', long_option: '--path', description: 'Some description here')
end

def given_arguments
  [
     EOP::RequiredArgument.new(name: 'path',
                               short_option: '-p',
                               long_option: '--path',
                               description: 'Some description here')
  ]
end

def given_a_flag_argument
  [
      EOP::FlagArgument.new(name: 'flag',
                            short_option: '-f',
                            long_option: '--flag',
                            description: 'This is a flag argument')
  ]
end

def given_an_optional_argument
  [
      EOP::OptionalArgument.new(name: 'optional',
                                short_option: '-o',
                                long_option: '--opt',
                                description: 'Optional Value')
  ]
end

def given_duplicated_arguments_by_name
  [
      EOP::RequiredArgument.new(name: 'path',
                                short_option: '-p',
                                long_option: '--path',
                                description: 'Some description here'),
      EOP::RequiredArgument.new(name: 'path',
                                short_option: '-o',
                                long_option: '--other',
                                description: 'Some other description here')
  ]
end

def given_duplicated_arguments_by_short
  [
      EOP::RequiredArgument.new(name: 'path',
                                short_option: '-p',
                                long_option: '--path',
                                description: 'Some description here'),
      EOP::RequiredArgument.new(name: 'other_path',
                                short_option: '-p',
                                long_option: '--other',
                                description: 'Some other description here')
  ]
end

def given_duplicated_arguments_by_long
  [
      EOP::RequiredArgument.new(name: 'path',
                                short_option: '-p',
                                long_option: '--path',
                                description: 'Some description here'),
      EOP::RequiredArgument.new(name: 'other_path',
                                short_option: '-o',
                                long_option: '--path',
                                description: 'Some other description here')
  ]
end