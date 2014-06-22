require 'spec_helper'

describe Parsel::Marshal do
  let(:key) { 'my secret key' }

  it 'encrypts data' do
    expect(Parsel::Marshal.encrypt(key, 'hello')).not_to eq(Marshal.dump('hello'))
  end

  it 'decrypts data' do
    encrypted = Parsel::Marshal.encrypt(key, 'hello')
    expect(Parsel::Marshal.decrypt(key, encrypted)).to eq('hello')
  end

  it 'returns false when decryption fails' do
    expect(Parsel::Marshal.decrypt('abc', '123')).to be_falsy
  end
end
