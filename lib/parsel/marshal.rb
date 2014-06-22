module Parsel
  module Marshal
    def self.encrypt(key, data)
      Parsel.encrypt(key, ::Marshal.dump(data))
    end

    def self.decrypt(key, data)
      ::Marshal.load Parsel.decrypt(key, data)
    rescue Exception
      false
    end
  end
end
