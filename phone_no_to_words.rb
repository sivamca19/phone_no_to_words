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
    return ERROR_MSG unless is_valid_no(phone_number)
    character_arrays = phone_number.chars.map { |digit| number_key_mapping[digit] }
    character_arrays_lng = character_arrays.length - 1
    results = []
    for i in (2..character_arrays_lng - 2)
      temp_split_array = []
      temp_split_array << character_arrays[0..i]
      next if temp_split_array.first.length < 3
      temp_split_array << character_arrays[i + 1..character_arrays_lng]
      next if temp_split_array.last.length < 3
      temp_combinate_array = []
      temp_combinate_array << temp_split_array.first.shift.product(*temp_split_array.first).map(&:join)
      next if temp_combinate_array.first.nil?
      temp_combinate_array << temp_split_array.last.shift.product(*temp_split_array.last).map(&:join)
      next if temp_combinate_array.last.nil?
      results << temp_combinate_array
    end
    results
  end
end
