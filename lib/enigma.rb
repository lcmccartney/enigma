class KeyGenerator
  def get_key
    key = (0..9).to_a.sample(7)
  end
end

class OffsetCalculator
  def initialize(key=nil,date=nil)
    @key = key.split('')
    @date = date

    if @key.nil?
      key_generator = KeyGenerator.new
      @key = key_generator.get_key
    end
    if @date.nil?
      @date = Time.new.strftime("%d%m%y").to_s
    end
    p "key is #{@key.join('')}, date is #{@date}"
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

    date_array = (((date_string.to_i) ** 2).to_s.split('')[-6..-1])

    offset << key_array[0].to_i + date_array[0].to_i
    offset << key_array[1].to_i + date_array[1].to_i
    offset << key_array[2].to_i + date_array[2].to_i
    offset << key_array[3].to_i + date_array[3].to_i
    offset << key_array[4].to_i + date_array[4].to_i
    offset << key_array[5].to_i + date_array[5].to_i

    offset
  end
end


class Enigma

  def initialize
    @char_index = {}
    @char_map = ("a".."z").to_a + ("0".."9").to_a << " " << "." << ","
    @char_map.each_with_index { |k,v| @char_index[k] = v }
  end

  def encrypt(my_message, key = nil, date = nil)
    my_message = my_message.split('')

    offset_calculator = OffsetCalculator.new(key, date)
    offset_array = offset_calculator.get_offset
    p offset_array
    p my_message
    encrypted_message = []

    my_message.each_with_index { |letter, index|
      position = @char_index[letter]
      offset = offset_array [index % offset_array.length]
      new_position = (position + offset) % @char_map.length
      encrypted_message[index] = @char_map[new_position]
    }

    encrypted_message.join('')
  end

  def decrypt(encrypted_message, key = nil, date = nil)
    encrypted_message = encrypted_message.split('')
    offset_calculator = OffsetCalculator.new(key, date)
    offset_array = offset_calculator.get_offset
    message = []

    encrypted_message.each_with_index { |letter, index|
      position = @char_index[letter]
      offset = offset_array [index % offset_array.length]
      new_position = (position - offset) % @char_map.length
      message[index] = @char_map[new_position]
    }

    message.join('')
  end
end


class Crack

    def initialize(message)
      @message = message
    end

end
