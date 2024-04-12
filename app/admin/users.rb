ActiveAdmin.register User do
  # Permit parameters if needed
  permit_params :name, :email, :etc

  index do
    selectable_column
    id_column
    # column :name
    column :email
    column "Orders" do |user|
      user.orders.count # Displays number of orders
    end
    actions
  end

  show do
    attributes_table do
      # row :name
      row :email
    end

    panel "Orders" do
      table_for user.orders do
        column :id
        column :created_at
        # column :status
        column "Total" do |order|
          number_to_currency(order.total) 
        end
        column "Products" do |order|
          ul do
            order.order_items.each do |item|
              li "#{item.product.product_name} - Quantity: #{item.quantity}"
            end
          end
        end
      end
    end
  end

  # Filters
  filter :name
  filter :email
  
  action_item :view_site do
    link_to "Back to Home Page", root_path
  end
end
