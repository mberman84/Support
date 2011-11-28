ActiveAdmin.register Issue do
  index do
    column :subject
    column :status
    default_actions
  end  
end
