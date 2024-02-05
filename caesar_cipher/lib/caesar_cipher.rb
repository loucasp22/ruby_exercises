module CaesarCipher

  LOWER_HASH = Hash[(1..26).to_a.zip('a'..'z')]
  UPPER_HASH = Hash[(1..26).to_a.zip('A'..'Z')]

  def self.encrypt(message, shift)
    encrypted = []
    message.each_char do |char|
      char_pos = LOWER_HASH.key(char) || UPPER_HASH.key(char)
      if char.match(/[a-z]/)
        encrypted << LOWER_HASH[((char_pos.to_i + shift)%26)]
      elsif char.match(/[A-Z]/)
        encrypted << UPPER_HASH[((char_pos.to_i + shift)%26)]
      else
        encrypted << char
      end
    end
    return encrypted.join('')
  end

  def self.dencrypt(message, shift)
    encrypted = []
    message.each_char do |char|
      char_pos = LOWER_HASH.key(char) || UPPER_HASH.key(char)
      if char.match(/[a-z]/)
        encrypted << LOWER_HASH[((char_pos.to_i - shift)%26)]
      elsif char.match(/[A-Z]/)
        encrypted << UPPER_HASH[((char_pos.to_i - shift)%26)]
      else
        encrypted << char
      end
    end
    return encrypted.join('')
  end

end
