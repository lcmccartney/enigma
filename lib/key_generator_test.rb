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

  def test_key_has_7_elements
    key_generator = KeyGenerator.new
    assert_equal 7, key_generator.get_key.length
  end

  def test_key_composed_of_integers
    key_generator = KeyGenerator.new
    assert key_generator.get_key.all? {|i|
                        i.is_a?(Integer) }
  end

  def test_keygen_is_an_array
    key_generator = KeyGenerator.new
    assert_equal String, key_generator.get_key.class
  end

end
