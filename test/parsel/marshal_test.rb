require "test_helper"

class MarshalTest < Minitest::Test
  let(:key) { "my secret key" }

  test "encrypts data" do
    refute_equal Marshal.dump("hello"), Parsel::Marshal.encrypt(key, "hello")
  end

  test "decrypts data" do
    encrypted = Parsel::Marshal.encrypt(key, "hello")
    assert_equal "hello", Parsel::Marshal.decrypt(key, encrypted)
  end

  test "returns false when decryption fails" do
    refute Parsel::Marshal.decrypt("abc", "123")
  end
end
