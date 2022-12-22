FactoryBot.define do
  factory :order do
    sequence(:description) { |n|  "Pedido número - #{n}" }
    customer #poderia fazer também :     association :customer, factory: :customer
  end
end
