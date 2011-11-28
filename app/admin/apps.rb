ActiveAdmin.register App do
  index do
    column :name, :sortable => :name do |app|
      link_to app.name, admin_app_path(app)
    end
    column :version
    column :platform
    default_actions
  end
end
