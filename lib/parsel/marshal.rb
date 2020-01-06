module Parsel
  module Marshal
    def self.encrypt(*args)
      Parsel.print_deprecation_message
      key, iv, data = Parsel.expand_args(args)
      Parsel.encrypt(key, iv, ::Marshal.dump(data))
    end

    def self.decrypt(*args)
      Parsel.print_deprecation_message
      key, iv, data = Parsel.expand_args(args)
      ::Marshal.load Parsel.decrypt(key, iv, data)
    rescue Exception
      false
    end
  end
end
