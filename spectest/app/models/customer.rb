class Customer < ApplicationRecord
    has_many :orders #estou dizendo que os customers tem vários pedidos 

    validates :address, presence: true  #is required, isso obriga que a minha factory tenha um endereço

    def full_name
        "Sr #{name}"
    end
end
