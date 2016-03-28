require "test_helper"

class ParselTest < Minitest::Test
  let(:key) { "my secret key" }

  test "encrypts data" do
    refute_equal "hello", Parsel.encrypt(key, "hello")
  end

  test "decrypts data" do
    encrypted = Parsel.encrypt(key, "hello")
    assert_equal "hello", Parsel.decrypt(key, encrypted)
  end

  test "returns false when decryption fails" do
    refute Parsel.decrypt("abc", "123")
  end

  test "uses custom iv" do
    iv = SecureRandom.hex(100)
    encrypted = Parsel.encrypt(key, iv, "hello")

    assert_equal "hello", Parsel.decrypt(key, iv, encrypted)
  end

  test "return false when decryption for custom iv fails" do
    iv = SecureRandom.hex(100)
    encrypted = Parsel.encrypt(key, iv, "hello")

    refute Parsel.decrypt(key, encrypted)
  end

  test "changes global iv" do
    iv = SecureRandom.hex(100)
    Parsel.default_iv = iv
    encrypted = Parsel.encrypt(key, "hello")

    assert_equal "hello", Parsel.decrypt(key, iv, encrypted)
  end
end
