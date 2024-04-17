class Province < ApplicationRecord
    has_many :users
    validates :name, presence: true
    validates :gst, :pst, :hst, numericality: true, allow_nil: true

    def self.ransackable_attributes(auth_object = nil)
        %w[created_at gst hst id id_value name pst updated_at]
    end
end
