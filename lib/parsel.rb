require "securerandom"
require "openssl"
require "base64"
require "json"
require "parsel/marshal"
require "parsel/json"
require "parsel/version"

module Parsel
  DEFAULT_IV = "f89209ffcdd1a225".freeze
  CIPHER = "AES-256-CBC".freeze

  def self.print_deprecation_message
    warn <<~TEXT
      `parsel` is no longer supported. Use at your own risk.
      Called from #{caller[1]}

    TEXT
  end

  def self.default_iv=(iv)
    @default_iv = iv
  end

  def self.default_iv
    @default_iv
  end

  self.default_iv = DEFAULT_IV

  def self.encrypt(*args)
    Parsel.print_deprecation_message
    encode cipher(:encrypt, *expand_args(args))
  end

  def self.decrypt(*args)
    Parsel.print_deprecation_message
    key, iv, data = expand_args(args)
    cipher(:decrypt, key, iv, decode(data))
  rescue Exception
    false
  end

  def self.expand_args(args)
    if args.size == 2
      iv = default_iv
      key, data = args
    else
      key, iv, data = args
    end

    [key, iv, data]
  end

  private
  def self.cipher(mode, key, iv, data)
    cipher = OpenSSL::Cipher.new(CIPHER).public_send(mode)
    cipher.key = Digest::SHA256.digest(key)
    cipher.iv = iv[0...cipher.iv_len]
    cipher.update(data) + cipher.final
  end

  def self.encode(data)
    Base64.encode64(data).gsub(/\n/, "")
  end

  def self.decode(data)
    Base64.decode64(data)
  end
end

Parsel.print_deprecation_message
