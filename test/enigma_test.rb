
require 'minitest/autorun'
require 'minitest/pride'
# require_relative 'crack.rb'
# require_relative 'decrypt.rb'
require './lib/enigma.rb'


class EnigmaTest < Minitest::Test

  def test_key_has_5_elements
    key_generator = KeyGenerator.new
    assert_equal 5, key_generator.get_key.length
  end

  def test_key_composed_of_5_integers
    key_generator = KeyGenerator.new
    assert key_generator.get_key.all? {|i|
                        i.is_a?(Integer) }
  end

  def test_init_accepts_key_arg
    # key_generator = KeyGenerator.new
    # key_generator.get_key
    offset_calculator = OffsetCalculator.new("38472", nil)
    assert "38472", offset_calculator
  end

  def test_init_accepts_date_arg
    # key_generator = KeyGenerator.new
    # key_generator.get_key
    offset_calculator = OffsetCalculator.new(nil, "040216")
    assert "040216", offset_calculator
  end

  # def test_random_5_goes_abcd
  #
  #   e = Enigma.new
  #   e.random
  #   assert_equal 4, e.abcd_randfive.length
  # end
  #
  # def test_date_is_4_digits
  #
  #   e = Enigma.new
  #   # encrypt.get_date
  #   assert_equal 4, e.get_date.length
  # end
end
