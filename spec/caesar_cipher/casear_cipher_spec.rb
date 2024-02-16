require_relative '../../lib/caesar_cipher/caesar_cipher'

describe CaesarCipher do
  subject { CaesarCipher }

  describe "#encrypt" do
    it "encrypts the message using the given shift factor" do
      message = "What a string!"
      shift = 5
      expect(subject.encrypt(message, shift)).to eq("Bmfy f xywnsl!")
    end
  end

  describe "#decrypt" do
    it "decrypts the message using the given shift factor" do
      message = "Bmfy f xywnsl!"
      expect(subject.bruteforce_decrypt(message)).to eq("What a string!")
    end
  end
end
