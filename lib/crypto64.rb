require 'openssl'
require 'base64'
include OpenSSL
include PKey

class RSA

  # Read the length of the private key.
  def size
    /(\d+ bit)/.match(self.to_text)[0].split(' ')[0].to_i
  end

  # Calculate the block size when encrypting.
  def encrypt_block_size
    (size/8)-12
  end

  # Calculate the block size when decrypting.
  def decrypt_block_size
    (size/8)-1
  end

  # Encrypt and base64 encode data of arbitrary length.
  def encrypt64(str)
    enc = ''
    while str.length > self.encrypt_block_size
      enc += self.public_encrypt(str[0..self.encrypt_block_size])
      str = str[self.encrypt_block_size+1..-1] if str.length > self.encrypt_block_size
    end
    if str.length != 0 then
      enc += self.public_encrypt(str[0..self.encrypt_block_size])
    end
    Base64.encode64(enc)
  end

  # Decrypt and base64 decode data of arbitrary length.
  def decrypt64(str)
    dec = ''
    str = Base64.decode64(str)
    while str.length != 0
      dec += self.private_decrypt(str[0..self.decrypt_block_size])
      str = str[self.decrypt_block_size+1..-1] if str.length > self.decrypt_block_size
    end
    dec
  end
end
