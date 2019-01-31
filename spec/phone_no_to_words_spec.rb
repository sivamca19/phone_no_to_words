require_relative '../phone_no_to_words'
describe PhoneNoToWords do
  before(:all) do
    @words = PhoneNoToWords.new
  end
  context '#is_valid_no' do
    it 'return true for valid number' do
      expect(@words.is_valid_no('6686787825')).to be(true)
      expect(@words.is_valid_no('2282668687')).to be(true)
    end

    it 'return false for invalid number' do
      expect(@words.is_valid_no('')).to be(false)
      expect(@words.is_valid_no('1282068681')).to be(false)
      expect(@words.is_valid_no('66867878255')).to be(false)
    end
  end

  context '#generate_words' do
    it 'return error message for invalid number' do
      expect(@words.generate_words('')).to be_an_instance_of(String)
      expect(@words.generate_words('')).to eq(ERROR_MSG)

      expect(@words.generate_words('1282068681')).to be_an_instance_of(String)
      expect(@words.generate_words('66867878255')).to eq(ERROR_MSG)
    end

    it 'return nil for valid number' do
      expect(@words.generate_words('6686787825')).to be_nil
      expect(@words.generate_words('2282668687')).to be_nil
    end
  end
end