require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "Create new Costumer" do
    customer = create(:customer)
    # customer = create(:customer, name: "teste") < sobrescrevendo se for o caso.
    expect(customer.full_name).to start_with("Sr")
  end

  it "Vip Herancy" do
    customer = create(:customer_vip )
    expect(customer.vip). to eq(true)
  end

  it "attributes_for" do
    attrs = attributes_for(:customer) #usa bastante trabalhando com json
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr")
  end

  it "transitory_attribute" do
    customer = create(:customer_default_male, upcased:true) # Como o upcased é true, ele vai entrar no meu factory after e trocar o valor para true
    expect(customer.name.upcase).to eq(customer.name)
  end

  it "Customer vip and male" do 
    male_vip_customer = create(:customer_vip, :male)
    expect(male_vip_customer.gender).to eq('M')
  end

  it "Customer default male" do 
    default_male_customer = create(:customer_default_male)
    expect(default_male_customer.gender).to eq('M')
  end

end
