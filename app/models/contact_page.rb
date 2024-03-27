class ContactPage < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["address", "created_at", "email", "id", "id_value", "phone", "title", "updated_at"]
    end
end
