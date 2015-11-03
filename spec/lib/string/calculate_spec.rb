require 'spec_helper'
require 'string/calculate'

describe String do

  context 'default operations' do

    it 'addition' do
      expect('2 + 3'.calculate).to eq(5)
    end

    it 'subtraction' do
      expect('6 - 4'.calculate).to eq(2)
    end

    it 'multiplication' do
      expect('2 * 4'.calculate).to eq(8)

    end

    it 'division' do
      expect('8 / 4'.calculate).to eq(2)
    end

    it 'advanced' do
      expect('10 / 1 * 2'.calculate).to eq(20)
      expect('15 + 35 -5 * 5'.calculate).to eq(25)
      expect('5 + 10 / 2 - 8 * 4'.calculate).to eq(-22)
      expect('16 * 12 / 6 + 67 - 12 + 20 / 5'.calculate).to eq(91)
    end

    it 'with floats' do
      expect('15.5 + 12.7'.calculate).to eq(28.2)
      expect('7.24 - 4.12'.calculate).to eq(3.12)
      expect('4.5 * 3'.calculate).to eq(13.5)
      expect('5.5 / 11'.calculate).to eq(0.5)
    end

    it 'with zero in division' do
      expect('5 / 0'.calculate).to eq('Error: divided by zero')
    end

    it 'with invalid arguments' do
      expect('5 +'.calculate).to eq('Error: arguments')
      expect('12 /'.calculate).to eq('Error: arguments')
    end

    context 'with invalid arguments' do

      it "raises error when are passed" do
        expect{ '5 +'.calc }.to raise_error(SyntaxError)
        expect{ '12 /'.calc }.to raise_error(SyntaxError)
        expect{ 'a+b'.calc }.to raise_error(NameError)
      end

    end

  end

end
