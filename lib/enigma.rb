class KeyGenerator
  def get_key
    key = (0..9).to_a.sample(5)
    #p key
  end
end

class OffsetCalculator
  def initialize(key=nil,date=nil)
    @key = key
    @date = date
    if @key.nil?
      key_gen = KeyGenerator.new
      @key = key_gen.get_key
    end
    if @date.nil?
      @date = Time.new.strftime("%d%m%y").to_s
    end
    p @key
    p @date
  end

  def get_offset
    key = @key
    date_string = @date
    key_array = []
    offset = []

    index = 0
    (key.length - 1).times {
      key_array << key[index].to_s +
                     key[index + 1].to_s
      index += 1
    }

    date_array = (((date_string.to_i) ** 2).to_s.split('')[-4..-1])

    offset << key_array[0].to_i + date_array[0].to_i
    offset << key_array[1].to_i + date_array[1].to_i
    offset << key_array[2].to_i + date_array[2].to_i
    offset << key_array[3].to_i + date_array[3].to_i

    return offset
  end
end

#random 5 key generator
class Enigma

  def initialize
    @char_array = ("a".."z").to_a + ("0".."9").to_a << " " << "." << ","

    # place_array = (0..99).to_a
    # char_array.zip(place_array).each do |char_array, place_array|
    #   puts "#{char_array} is #{place_array}"
      @char_hash = {}
      @char_array.each_with_index { |k,v| @char_hash[k] = v }
  end

  def encrypt(message, key = nil, date = nil)
    message = message.split('')
    offset_calculator = OffsetCalculator.new(key, date)
    offset_array = offset_calculator.get_offset
    encrypted_message = []

    message.each_with_index { |letter, index|
      position = @char_hash[letter]
      offset = offset_array [index % offset_array.length]
      new_position = (position + offset) % @char_array.length
      encrypted_message[index] = @char_array[new_position]
    }

    return encrypted_message.join('')
  end

  def decrypt(encrypted_message, key = nil, date = nil)
    encrypted_message = encrypted_message.split('')
    offset_calculator = OffsetCalculator.new(key, date)
    offset_array = offset_calculator.get_offset
    message = []

    encrypted_message.each_with_index { |letter, index|
      position = @char_hash[letter]
      offset = offset_array [index % offset_array.length]
      new_position = (position - offset) % @char_array.length
      message[index] = @char_array[new_position]
    }

    return message.join('')
  end
  #def crack
  #end
end
