ActiveAdmin.register ContactPage do
  permit_params :title, :phone, :email, :address

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
