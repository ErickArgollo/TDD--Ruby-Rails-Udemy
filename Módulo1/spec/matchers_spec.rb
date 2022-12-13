describe 'Matchers' do
    it '#equal ou be - testa se é o mesmo objeto' do
    x = 'teste'
    y = 'teste'
    expect(x).not_to equal(y) 
    end

    it '#be_truthy #be_falsey #be_nil' do 
        expect(1.odd?).to be_truthy
    end

    it 'comparações >, >=, <, <=' do
        expect(2).to be > 1
    end

    it '#be_between' do
        expect(2).to be_between(1,3).inclusive #valor entre 1 e 3, incluindo o propio número
        #tem também o .exclusive que é o contrário
    end

    it '#match' do
        expect("testE").to match(/teste/i)
    end

    it '#start_with #end_with' do
        expect("testE").to start_with('t')
        expect([1, 2, 3]).to end_with(3)
    end

    #classes e tipos
    it '#be_instance_of e be_kind_of' do #o be_instance é para a classe q está sendo testada, já o be_kind_of pode ser por herança.
        expect(10).to be_instance_of(Integer)
    end

    ####################
    class Pessoa
        attr_accessor :nome, :idade
    end
    
    it'have_attributes' do
        pessoa = Pessoa.new
        pessoa.nome = 'teste'
        expect(pessoa).to have_attributes(nome: start_with('t'))

    end

    #predicados 
    it 'be_nil, be_zero, be_empty, be_odd, be_even' do  #todo método do ruby que pode ser "perguntado" nil? odd? etc. pode ser testado utilizando o be.
        expect(nil).to be_nil
    end

    #matchers de erro

    it '#raise_exception, to raise_error' do #Quando tiver um erro, e eu quiser que ele seja interpretado para usar o matcher de erro, coloco entre chaves o meu expect
        expect{ 3 / 0 }.to raise_exception
        expect{ 2 / 0 }.to raise_error(ZeroDivisionError,"divided by 0") #primeiro parametro é o tipo o segundo a mensagem. 
    end

    #matchers para arrays
    it '#include' do  #elementos do array
        expect([1, 2]).to include(2, 1)
    end

    it '#match_array, #contain_exactly' do #funciona com elementos exatos, no caso exatamente oq é passado. 
        expect([1, 2]).to match_array([2, 1])
    end

    #matcher para ranges
    it '#cover' do 
     expect(1..5).to cover(2, 5)
    end
end

#one liner + describe instanciado
describe (1..5), 'teste' do 
    it { is_expected.to cover(2, 5) }
end

#composição

describe "ruby" do
    it { is_expected.to start_with('r').and end_with('y') } #and ou or
end

describe [1, 7, 9] do
    it { is_expected.to all((be_even).or be_an(Integer))} 
end

describe 2.5, '#be_within' do 
    it { is_expected.to be_within(0.5).of(3)}
    #vai de 2.5 até 3.5
end

#before all/ context antes de todos os testes naquele describe ele faz tal coisa no js config.before(:all || :context)
#after all/ context

#before each(:each || :example), after each, antes de cada teste e depois de cada teste


describe 'Atributos' do 
    let(:pessoa) { Pessoa.new } # o let substitui o before de certa forma, a prinicpal diferença é que nesse caso não vou precisar utilizar uma variavel de instância @ e ele só será invocado nos testes que chamarem a minha váriavel pessoa

    # tem também o let! < nesse caso eu forço a invocar antes de cada teste. independente de ser chamado ou não.
    it 'have_attributes' do 
        pessoa.nome = 'Erick'
        pessoa.idade = 23
        expect(pessoa).to have_attributes(nome: 'Erick', idade: 23)
    end

    it 'have_attributes' do 
        pessoa.nome = 'Teste'
        pessoa.idade = 20
        expect(pessoa).to have_attributes(nome: /teste/i, idade: (a_value < 23))
    end
end