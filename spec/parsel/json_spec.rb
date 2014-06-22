require 'spec_helper'

describe Parsel::JSON do
  let(:key) { 'my secret key' }

  it 'encrypts data' do
    expect(Parsel::JSON.encrypt(key, ['hello'])).not_to eq(JSON.dump(['hello']))
  end

  it 'decrypts data' do
    encrypted = Parsel::JSON.encrypt(key, ['hello'])
    expect(Parsel::JSON.decrypt(key, encrypted)).to eq(['hello'])
  end

  it 'returns false when decryption fails' do
    expect(Parsel::JSON.decrypt('abc', '123')).to be_falsy
  end
end
