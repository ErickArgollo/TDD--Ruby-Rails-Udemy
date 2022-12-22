require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "Create new Costumer" do
    customer = create(:customer)
    expect(customer.full_name).to eq("Sr teste")
  end
end
