require "spec_helper"

describe Parsel do
  let(:key) { "my secret key" }

  it "encrypts data" do
    Parsel.encrypt(key, "hello").should_not eql("hello")
  end

  it "decrypts data" do
    encrypted = Parsel.encrypt(key, "hello")
    Parsel.decrypt(key, encrypted).should eql("hello")
  end

  it "returns false when decryption fails" do
    Parsel.decrypt("abc", "123").should be_false
  end
end
