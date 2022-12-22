FactoryBot.define do 
  factory :customer, aliases: [:user] do # posso chamaar de customer ou user
    #transient > serão ignorados no teste, serve para que possamos controlar alguma coisa específica na nossa factory, baseado nisso eu faço o meu after 
    transient do 
        upcased { false }
    end


    name { Faker::Name.name }
    email { Faker::Internet.email }
    
    ##Ideia de Herança
     factory :customer_vip do
        vip { true }
        days_to_pay { 30 }
     end

     trait :default do
        vip { false }
        days_to_pay { 15 }
     end

     #traits
     trait :male do  #Utilizando isso, lá no meu teste eu posso ter um customer que é vip e é do sexo masculino. 
        gender { "M" } 
     end

     factory :customer_default_male, traits: [:default, :male] #outra forma de fazer, juntando as informações em um cara só.


    #executado após o create
     after(:create) do |customer, evaluator|
        customer.name.upcase! if evaluator.upcased 
     end     
  end
end