module CaesarCipher

  LOWER_HASH = Hash[(1..26).to_a.zip('a'..'z')]
  UPPER_HASH = Hash[(1..26).to_a.zip('A'..'Z')]

  def self.encrypt(message, shift)
    message
      .split('')
      .map do |char|
        lower_char_pos = LOWER_HASH.key(char)
        if lower_char_pos
          next LOWER_HASH[((lower_char_pos.to_i + shift)%26)]
        end

        upper_char_pos = UPPER_HASH.key(char)
        if upper_char_pos
          next UPPER_HASH[((upper_char_pos.to_i + shift)%26)]
        end

        char
      end
      .join('')
  end

  def self.bruteforce_decrypt(message)

    (1..26)
      .map do |possible_shift|
        encrypt(message, -possible_shift)
      end
      .max_by do |decrypted_message|
        decrypted_message.scan(/[ETAOIN SHRDLU]/i).size
      end
  end
end