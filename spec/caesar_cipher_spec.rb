# frozen_string_literal: true

require './lib/caesar_cipher'

describe '#ceaser_cipher' do
  it 'not returns the same string' do
    expect(ceaser_cipher('aaaa', 2)).not_to eql('aaaa')
  end

  it 'returns the modified string' do
    expect(ceaser_cipher('aaaa', 2)).to eql('cccc')
  end

  it 'returns the downcase string' do
    expect(ceaser_cipher('AaaA', 2)).to eql('cccc')
  end

  it 'returns the same string' do
    expect(ceaser_cipher('aaaa', 0)).to eql('aaaa')
  end

  it 'returns the string of numbers' do
    expect(ceaser_cipher('1234', 2)).to eql('1234')
  end
end
