require 'minitest/autorun'
require_relative './test_helper'

class TestEasyOptionParser < MiniTest::Test
  def test_contains_a_title
    # simulate the entry of arguments
    ARGV.concat(%w(-p ./path))
    title = 'My title'
    options = given_arguments
    parser = EasyOptionParser.new(title, options)

    assert_equal(parser.title, title)
  end

  def test_options_cannot_be_nil
    assert_raises do
      EasyOptionParser.new('title', nil)
    end
  end

  def test_options_cannot_be_empty
    assert_raises do
      EasyOptionParser.new('title', [])
    end
  end

  def test_options_cannot_be_a_hash
    assert_raises do
      EasyOptionParser.new('title', {name: 'path'})
    end
  end

  def test_raise_error_when_require_arg_is_missing
    options = given_arguments
    assert_raises do
      EasyOptionParser.new('title', options)
    end
  end

  def test_optional_argument_can_be_nil
    optional_arguments = given_an_optional_argument
    parser = EasyOptionParser.new('Title', optional_arguments)
    assert parser.options.include?(:optional)
    assert parser.options[:optional].nil?
  end

  def test_contains_an_argument
    # simulate the entry of arguments
    ARGV.concat(%w(-p ./path))
    options = given_arguments
    parser = EasyOptionParser.new('title', options)

    assert parser.contains?('path')
  end

  def test_accept_flag_argument
    # simulate the entry of arguments
    ARGV << '-f'
    options = given_a_flag_argument
    parser = EasyOptionParser.new('title', options)

    assert parser.options[:flag]
  end

  def test_accept_missing_flag_argument
    options = given_a_flag_argument
    parser = EasyOptionParser.new('title', options)

    assert !parser.options[:flag]
  end

  def test_raise_error_when_arguments_has_duplicated_name
    options = given_duplicated_arguments_by_name

    assert_raises do
      EasyOptionParser.new('title', options)
    end
  end

  def test_raise_error_when_arguments_has_duplicated_short
    options = given_duplicated_arguments_by_short

    assert_raises do
      EasyOptionParser.new('title', options)
    end
  end

  def test_raise_error_when_arguments_has_duplicated_long
    options = given_duplicated_arguments_by_long

    assert_raises do
      EasyOptionParser.new('title', options)
    end
  end

  def test_required_argument_contains_required_mark
    required_option = given_a_required_option
    assert required_option.description.include?('*')
  end
end