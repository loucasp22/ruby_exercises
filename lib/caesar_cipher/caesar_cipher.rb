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
    decrypted_messages = []

    (1..26).each do |shift|
      decrypted_message = encrypt(message, -shift)
      decrypted_messages << decrypted_message
    end

    decrypted_messages.max_by { |message| message.scan(/[ETAOIN SHRDLU]/i).size }
  end

end
