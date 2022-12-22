class Customer < ApplicationRecord
    attr_accessor :gender
    def full_name
        "Sr #{name}"
    end
end
