class Comment < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user
  
  acts_as_api
  
  api_accessible :default do |template|
    template.add :subject
    template.add :content
    template.add :user_id
    template.add :issue_id
    template.add :created_at
    template.add :updated_at
    template.add :voterships
  end
end
