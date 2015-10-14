require 'spec_helper'

describe Parsel do
  let(:key) { 'my secret key' }

  it 'encrypts data' do
    expect(Parsel.encrypt(key, 'hello')).not_to eq('hello')
  end

  it 'decrypts data' do
    encrypted = Parsel.encrypt(key, 'hello')
    expect(Parsel.decrypt(key, encrypted)).to eq('hello')
  end

  it 'returns false when decryption fails' do
    expect(Parsel.decrypt('abc', '123')).to be_falsy
  end

  it 'uses custom iv' do
    iv = SecureRandom.hex(100)
    encrypted = Parsel.encrypt(key, iv, 'hello')

    expect(Parsel.decrypt(key, iv, encrypted)).to eq('hello')
  end

  it 'return false when decryption for custom iv fails' do
    iv = SecureRandom.hex(100)
    encrypted = Parsel.encrypt(key, iv, 'hello')

    expect(Parsel.decrypt(key, encrypted)).to be_falsy
  end

  it 'changes global iv' do
    iv = SecureRandom.hex(100)
    Parsel.default_iv = iv
    encrypted = Parsel.encrypt(key, 'hello')

    expect(Parsel.decrypt(key, iv, encrypted)).to eq('hello')
  end
end
