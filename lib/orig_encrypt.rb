#random 5 key generator
class Encrypt

  def initialize
    @random_five = []
    @first_abcd = []
    @last_four = []
  end

  def random
    5.times {@random_five << rand(0..9)}
      p @random_five
  end

  def abcd_randfive
    index = 0
    (@random_five.length - 1).times {
      @first_abcd << @random_five[index].to_s +
                     @random_five[index + 1].to_s
      index += 1
    }
    p @first_abcd
  end

  def get_date
    @date_string = Time.new.strftime("%d%m%y").to_s
    p @date_string
  end

  def abcd_date
    @last_four << (((@date_string.to_i) ** 2).to_s[-4..-1])
    p @last_four
  end
end
