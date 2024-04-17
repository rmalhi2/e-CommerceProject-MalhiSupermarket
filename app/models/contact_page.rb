class ContactPage < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["address", "created_at", "email", "id", "id_value", "phone", "title", "updated_at"]
    end

    validates :title, presence: true
    validates :address, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true, numericality: { only_integer: true }
end
