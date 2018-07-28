require 'easy_opt_parser/domain/command_option'

module EOP
  class RequiredArgument < CommandOption
    def initialize(name:, short_option:, long_option:, description:, default_value: '')
      @name = name
      @short_option = short_option
      @long_option = long_option
      @description = "#{description} *"
      @default_value = default_value
      @required = true
    end
  end
end
