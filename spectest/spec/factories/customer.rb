FactoryBot.define do 
  factory :customer, aliases: [:user] do # posso chamaar de customer ou user
    #transient > serão ignorados no teste, serve para que possamos controlar alguma coisa específica na nossa factory, baseado nisso eu faço o meu after 
    transient do 
        upcased { false }
        qtt_orders { 3 }
    end

    #email { Faker::Internet.email }
    sequence(:email) { |n| "email#{n}@email.com" } #toda vez que chamar essa factory, ele vai colocar numerações diferentes
    #sequence(:email, numero que vai começar)

    name { Faker::Name.name }
    
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

     trait :with_orders do 
        after(:create) do |customer, evaluator|
            create_list(:order, evaluator.qtt_orders, customer: customer) #passo esse customer como o elemento atual da minha factory, já que order tem como referencia customer que é cada cliente
         end # o evaluator é usado para acessar o valor de qtt_order e passar ele como argumento pro create_list.
     end

     factory :customer_default_male, traits: [:default, :male] #outra forma de fazer, juntando as informações em um cara só.

    #executado após o create
     after(:create) do |customer, evaluator|
        customer.name.upcase! if evaluator.upcased 
     end     
  end
end