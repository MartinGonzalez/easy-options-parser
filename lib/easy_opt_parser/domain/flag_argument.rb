require 'easy_opt_parser/domain/command_option'

module EOP
  class FlagArgument < CommandOption
    def initialize(name:, short_option:, long_option:, description:)
      @name = name
      @short_option = short_option
      @long_option = long_option
      @description = description
      @default_value = false
      @required = false
    end
  end
end
