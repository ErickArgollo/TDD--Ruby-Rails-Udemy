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
    

end