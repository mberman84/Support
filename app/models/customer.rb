class Customer < ActiveRecord::Base
  has_many :issues, :through => :users_issues
end
