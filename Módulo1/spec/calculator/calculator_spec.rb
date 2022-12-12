require "calculator"

describe "#calculator" do
  # É interessante utilizar o context caso eu tenha mais de um teste para o mesmo método, se tiver apenas um único teste, posso considerar utilizar o it direto. 
  subject(:calc) { Calculator.new() } # caso tivesse um initialize poderia passar aqui. 
  #nessa primeira parte, estou de certa forma renomeando o subject, daí lá embaixo posso utilizar  result = calc.X
  context "#sum" do # #sum pois é uma instância
    it "positive numbers" do
      result = subject.sum(5, 7)
      # ao invés de ficar instanciando o objeto, posso simplesmente utilizar o subject. 
      expect(result).to eq(12)
    end

    # teste usando o not to
    it "positive numbers with wrong answer" do
      result = calc.sum(5, 7) 
      expect(result).not_to eq(11)
    end
  end
end
