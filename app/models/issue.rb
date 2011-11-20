class Issue < ActiveRecord::Base
  has_many :users, :through => :users_issues
end
