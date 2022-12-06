require "calculator"

describe Calculator do
  # É interessante utilizar o context caso eu tenha mais de um teste para a mesma classe, se tiver apenas um único teste, posso considerar utilizar o it direto. 
  context "#sum" do # #sum pois é uma instância
    it "positive numbers" do
      calc = Calculator.new
      result = calc.sum(5, 7)
      expect(result).to eq(12)
    end

    # teste usando o not to
    it "positive numbers with wrong answer" do
      calc = Calculator.new
      result = calc.sum(5, 7)
      expect(result).not_to eq(11)
    end
  end
end
