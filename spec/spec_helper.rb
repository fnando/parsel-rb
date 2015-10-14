require 'bundler/setup'
require 'parsel'

RSpec.configure do |config|
  config.before do
    Parsel.default_iv = Parsel::DEFAULT_IV
  end
end
