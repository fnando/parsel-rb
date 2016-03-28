require "bundler/setup"
require "parsel"
require "minitest/utils"
require "minitest/autorun"

module Minitest
  class Test
    setup do
      Parsel.default_iv = Parsel::DEFAULT_IV
    end
  end
end
