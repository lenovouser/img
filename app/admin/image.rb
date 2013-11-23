ActiveAdmin.register Image do

  controller do
    defaults :finder => :find_by_token
  end
  
  index do
    column :id
    column :created_at
    column :image do |image|
      image_tag(image.image.url(:thumb))
    end
    default_actions
  end
  
  show do |ad|
    attributes_table do
      row :id
      row :token
      row :remote_addr
      row :created_at
      row :updated_at
      row :image do
        image_tag(image.image.url(:medium))
      end
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :token
      f.input :remote_addr
      f.input :image
    end
    f.actions
  end
  
end
