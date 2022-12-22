FactoryBot.define do 
  factory :customer, aliases: [:user] do # posso chamaar de customer ou user
    name { Faker::Name.name }
    email { Faker::Internet.email }

    ##Ideia de Herança
     factory :customer_vip do
        vip { true }
        days_to_pay { 30 }
     end

     factory :customer_default do
        vip { false }
        days_to_pay { 15 }
     end
  end
end