class Product < ApplicationRecord
  belongs_to :category

  has_one_attached :image

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :product_price, numericality: true
  validates :quantity_available, numericality: { only_integer: true }

  scope :with_attached_image, -> { left_joins(:image_attachment).where.not(active_storage_attachments: { id: nil }) }
  def self.ransackable_scopes(auth_object = nil)
    %i[with_attached_image]
  end

  scope :search_by_keyword_and_category, ->(keyword, category_id) do
    if category_id.present?
      where("product_name LIKE ? OR product_description LIKE ?", "%#{keyword}%", "%#{keyword}%").where(category_id: category_id)
    else
      where("product_name LIKE ? OR product_description LIKE ?", "%#{keyword}%", "%#{keyword}%")
    end
  end



  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "id", "id_value", "product_description", "product_name", "product_price", "quantity_available", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end
