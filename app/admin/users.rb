ActiveAdmin.register User do
  index do
    column :name, :sortable => :name do |user|
      link_to user.name, admin_user_path(user)
    end
    column :email
    default_actions
  end
  
  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
    end
    f.buttons
  end
end
