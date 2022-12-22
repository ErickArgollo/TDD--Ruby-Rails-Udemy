require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "Create new Costumer" do
    customer = create(:customer)
    # customer = create(:customer, name: "teste") < sobrescrevendo se for o caso.
    expect(customer.full_name).to start_with("Sr")
  end

  it "Vip Herança" do
    customer = create(:customer_vip )
    expect(customer.vip). to eq(true)
  end
end
