require 'minitest/autorun'
require 'minitest/pride'

require './lib/enigma.rb'

class EnigmaTest < Minitest::Test

  def setup
    @char_map = ("a".."z").to_a + ("0".."9").to_a << " " << "." << ","
    @char_index = {}
    @char_map.each_with_index { |k,v| @char_index[k] = v }
    @encrypted_message = "hello"
  end

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

  def test_the_character_map_is_correct_array
    e = Enigma.new
    assert @char_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
       "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], e
  end

  def test_the_char_index_is_a_hash
    e = Enigma.new
    assert_equal Hash, @char_index.class
  end

  def test_value_char_index_returns_expected_key
    e = Enigma.new
    assert_equal 0, @char_index["a"]
    assert_equal 1, @char_index["b"]
    assert_equal 36, @char_index[" "]
    assert_equal 37, @char_index["."]
    assert_equal 38, @char_index[","]
  end


#********************TESTED*****************************
#ruby encrypt.rb encrypted.txt decrypted.txt 4706351 060416
#ruby decrypt.rb message_to_encrypt.txt encrypted.txt


end
