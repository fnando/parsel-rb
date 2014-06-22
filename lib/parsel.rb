require 'openssl'
require 'base64'
require 'parsel/marshal'
require 'parsel/version'

module Parsel
  def self.encrypt(key, data)
    encode cipher(:encrypt, key, data)
  end

  def self.decrypt(key, data)
    cipher(:decrypt, key, decode(data))
  rescue Exception
    false
  end

  private
  def self.cipher(mode, key, data)
    cipher = OpenSSL::Cipher.new('AES-256-CBC').public_send(mode)
    cipher.key = Digest::SHA256.digest(key)
    cipher.iv = 'f89209ffcdd1a225'
    cipher.update(data) + cipher.final
  end

  def self.encode(data)
    Base64.encode64(data).gsub(/\n/, '')
  end

  def self.decode(data)
    Base64.decode64(data)
  end
end
