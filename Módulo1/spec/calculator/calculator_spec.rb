require 'calculator'

describe Calculator do 
  it 'sum method for 2 numbers' do
    calc = Calculator.new
    result = calc.sum(5, 7)
    expect(result).to eq(12)
  end

  # teste usando o o not to
  it 'sum method for 2 numbers' do
    calc = Calculator.new
    result = calc.sum(5, 7)
    expect(result).not_to eq(11)
  end

  
end  