require 'byebug'
ERROR_MSG = "Can't generate words: As length may be greater or lesser than 10 (or) phone number has 0 or 1 values".freeze
class PhoneNoToWords
  attr_accessor :number_key_mapping
  def initialize
    @number_key_mapping = {
      '2' => %w[a b c],
      '3' => %w[d e f],
      '4' => %w[g h i],
      '5' => %w[j k l],
      '6' => %w[m n o],
      '7' => %w[p q r s],
      '8' => %w[t u v],
      '9' => %w[w x y z]
    }
  end

  def is_valid_no(phone_no)
    (phone_no.to_s.chars - %w[1 0]).length == 10
  end

  def generate_words(phone_number)
    ERROR_MSG unless is_valid_no(phone_number)
  end
end
