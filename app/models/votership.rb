class Votership < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue
  
  acts_as_api
  
  validates_uniqueness_of :issue_id, :scope => :user_id
  
  api_accessible :default do |template|
    template.add :issue_id
    template.add :user_id
    template.add :direction
    template.add :created_at
    template.add :updated_at
  end
end
