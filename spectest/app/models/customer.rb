class Customer < ApplicationRecord
    has_many :orders #estou dizendo que os customers tem vários pedidos 
    def full_name
        "Sr #{name}"
    end
end
