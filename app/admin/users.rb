ActiveAdmin.register User do
  index do
    column :name
    column :email
    default_actions
  end
end
