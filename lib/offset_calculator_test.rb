require 'minitest/autorun'
require 'minitest/pride'

require './lib/enigma.rb'

class EnigmaTest < Minitest::Test

  def test_init_date_is_generated_if_nil
    offset_calculator = OffsetCalculator.new(key="7654532")
    refute nil, offset_calculator.get_offset
  end

  def test_key_array_is_created_based_on_key
    offset_calculator = OffsetCalculator.new(key="1234567", date="060416")
    offset_calculator.get_offset
    assert_equal [12, 32, 37, 45, 61, 73], offset_calculator.get_offset
  end

  def test_the_offset_is_array_with_6_elements
    offset_calculator = OffsetCalculator.new(key="1234567", date="060416")
    assert_equal String, offset_calculator.get_offset.class
    assert_equal 6, offset_calculator.get_offset.count
  end

end
