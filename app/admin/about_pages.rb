ActiveAdmin.register AboutPage do
  permit_params :title, :paragraph1, :paragraph2, :paragraph3, :paragraph4, :paragraph5

  form do |f|
    f.inputs "About Page Details" do
      f.input :title
      f.input :paragraph1
      f.input :paragraph2
      f.input :paragraph3
      f.input :paragraph4
      f.input :paragraph5
    end
    f.actions
  end
end
