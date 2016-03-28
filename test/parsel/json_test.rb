require "test_helper"

class JsonTest < Minitest::Test
  let(:key) { "my secret key" }

  test "encrypts data" do
    refute_equal JSON.dump(["hello"]), Parsel::JSON.encrypt(key, ["hello"])
  end

  test "decrypts data" do
    encrypted = Parsel::JSON.encrypt(key, ["hello"])
    assert_equal ["hello"], Parsel::JSON.decrypt(key, encrypted)
  end

  test "returns false when decryption fails" do
    refute Parsel::JSON.decrypt("abc", "123")
  end
end
