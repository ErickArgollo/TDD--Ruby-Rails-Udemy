require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to' do 
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'more one order' do 
    orders = create_list(:order, 3) #o list cria a quantidade de instâncias que quero trabalhar, poderia sobrescrever o atributo caso quisesse, ex: (:order, 3, description: 'xablau')
    expect(orders.count).to eq(3)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders)
    expect(customer.orders.count).to eq(3)
  end
end
