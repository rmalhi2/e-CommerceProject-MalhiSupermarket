ActiveAdmin.register Product do
  permit_params :product_name, :product_description, :product_price, :quantity_available, :category_id, :image

  filter :with_attached_image, as: :boolean
  form do |f|
    f.inputs "Product Details" do
      f.input :product_name
      f.input :product_description
      f.input :product_price
      f.input :quantity_available
      f.input :category_id, as: :select, collection: Category.pluck(:category_name, :id)
      f.input :image, as: :file, hint: f.object.image.attached? ? image_tag(f.object.image, size: "50x50") : content_tag(:span, "No image yet")
    end
    f.actions
  end

  


  action_item :view_site do
    link_to "Back to Home Page", root_path
  end
end
