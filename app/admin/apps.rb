ActiveAdmin.register App do
  index do
    column :name
    column :version
    column :platform
    default_actions
  end
end
