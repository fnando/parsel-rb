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
end
