class Issue < ActiveRecord::Base
  has_many :associations, :dependent => :destroy
  has_many :users, :through => :associations
  belongs_to :app
end
