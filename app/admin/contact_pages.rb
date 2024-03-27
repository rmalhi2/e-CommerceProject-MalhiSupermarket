ActiveAdmin.register ContactPage do
  permit_params :title, :phone, :email, :address

  action_item :view_site do
    link_to "Back to Home Page", root_path
  end

  form do |f|
    f.inputs "Contact Page Details" do
      f.input :title
      f.input :phone
      f.input :email
      f.input :address
    end
    f.actions
  end
end
