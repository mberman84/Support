ActiveAdmin.register Issue do
  index do
    column :subject, :sortable => :subject do |issue|
      link_to issue.subject, admin_issue_path(issue)
    end
    column :status
    default_actions
  end  
end
