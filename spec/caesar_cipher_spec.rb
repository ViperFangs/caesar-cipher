require_relative '../caesar_cipher'

describe CaesarCipher do
  describe '#encrypt' do
    it 'Encrypts a string' do
      encrypted = CaesarCipher.new.encrypt('What a string!', 5)
      expect(encrypted).to eql 'Bmfy f xywnsl!'
    end
  end
end