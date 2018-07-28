require 'optparse'
require 'easy_opt_parser/domain/flag_argument'

class EasyOptionParser
  attr_reader :options, :title

  def initialize(title, arguments)
    @options = {}
    @title = title
    assert_valid_arguments!(arguments, symbol: :name)
    assert_valid_arguments!(arguments, symbol: :short_option)
    assert_valid_arguments!(arguments, symbol: :long_option)
    populate_with_default_values(arguments)

    parser = OptionParser.new do |opts|
      opts.banner = @title
      create_value_arguments(opts, arguments.reject {|arg| arg.is_a?(EOP::FlagArgument)})
      create_flag_arguments(opts, arguments.select { |arg| arg.is_a?(EOP::FlagArgument) })
      create_help_argument(opts)
    end
    parser.parse!

    assert_required_arguments!(arguments)
  end

  def create_flag_arguments(opts, arguments)
    arguments.each do |arg|
      argument_with(opts, arg.name, arg.short_option, arg.long_option, arg.description)
    end
  end

  def create_value_arguments(opts, arguments)
    arguments.each do |arg|
      long_option = create_long_option_from(arg)
      argument_with(opts, arg.name, arg.short_option, long_option, arg.description)
    end
  end

  def create_long_option_from(argument)
    "#{argument.long_option} #{argument.name}"
  end

  def contains?(name)
    @options.include?(name.to_sym)
  end

  private

  def assert_valid_arguments!(arguments, symbol:)
    raise 'Arguments must be an Array' unless arguments.is_a?(Array)
    raise 'Arguments cannot be nil' if arguments.nil?
    raise 'Arguments cannot be empty' if arguments.empty?
    argument_names = arguments.map(&symbol)
    raise 'Duplicated value in options' if argument_names.detect{|a| argument_names.count(a) > 1}
  end

  def populate_with_default_values(arguments)
    arguments.each do |argument|
      @options[argument.name.to_sym] = argument.default_value
    end
  end

  def argument_with(opts, name, short, long, description)
    opts.on(short, long, description) do |value|
      @options[name.to_sym] = value
    end
  end

  def create_help_argument(opts)
    opts.on('-h', '--help', 'Displays Help') do
      puts opts
      exit
    end
  end

  def assert_required_arguments!(arguments)
    required_arguments = arguments.select(&:required)
    required_arguments.each do |arg|
      raise "Missing Argument [#{arg.name}]" if @options[arg.name.to_sym].to_s.empty?
    end
  end
end