ActiveAdmin.register Product do
  permit_params :product_name, :product_description, :product_price, :quantity_available, :category_id

  form do |f|
    f.inputs "Product Details" do
      f.input :product_name
      f.input :product_description
      f.input :product_price
      f.input :quantity_available
      f.input :category_id, as: :select, collection: Category.pluck(:category_name, :id)
    end
    f.actions
  end
end
