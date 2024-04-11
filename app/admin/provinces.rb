ActiveAdmin.register Province do
  permit_params :name, :gst, :pst, :hst

  index do
    selectable_column
    id_column
    column :name
    column :gst
    column :pst
    column :hst
    actions
  end

  filter :name

  form do |f|
    f.inputs "Province Details" do
      f.input :name
      f.input :gst, label: "GST Rate (%)"
      f.input :pst, label: "PST Rate (%)"
      f.input :hst, label: "HST Rate (%)"
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :gst
      row :pst
      row :hst
    end
  end

  action_item :view_site do
    link_to "Back to Home Page", root_path
  end
end
