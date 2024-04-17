class AboutPage < ApplicationRecord

  validates :title, presence: true
  validates :paragraph1, :paragraph2, :paragraph3, :paragraph4, :paragraph5, presence: true, allow_blank: true
  
  def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "id_value", "paragraph1", "paragraph2", "paragraph3", "paragraph4", "paragraph5", "title", "updated_at"]
  end
end
