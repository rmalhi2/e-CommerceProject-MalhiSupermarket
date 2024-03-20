class Product < ApplicationRecord
  belongs_to :category

  scope :search_by_keyword_and_category, ->(keyword, category_id) do
    if category_id.present?
      where("product_name LIKE ? OR product_description LIKE ?", "%#{keyword}%", "%#{keyword}%").where(category_id: category_id)
    else
      where("product_name LIKE ? OR product_description LIKE ?", "%#{keyword}%", "%#{keyword}%")
    end
  end
end
