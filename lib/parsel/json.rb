module Parsel
  module JSON
    def self.encrypt(*args)
      Parsel.print_deprecation_message
      key, iv, data = Parsel.expand_args(args)
      Parsel.encrypt(key, iv, ::JSON.dump(data))
    end

    def self.decrypt(*args)
      Parsel.print_deprecation_message
      key, iv, data = Parsel.expand_args(args)
      ::JSON.load Parsel.decrypt(key, iv, data)
    rescue Exception
      false
    end
  end
end
