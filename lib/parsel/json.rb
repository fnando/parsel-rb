module Parsel
  module JSON
    def self.encrypt(key, data)
      Parsel.encrypt(key, ::JSON.dump(data))
    end

    def self.decrypt(key, data)
      ::JSON.load Parsel.decrypt(key, data)
    rescue Exception
      false
    end
  end
end
