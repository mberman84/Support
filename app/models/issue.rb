class Issue < ActiveRecord::Base
  has_many :associations, :dependent => :destroy
  has_many :users, :through => :associations
  belongs_to :app
  
  STATUS = ['Open', 'Closed']
  
  validates :subject, :presence => true,
                      :length => { :maximum => 50 }
  validates :description, :presence => true,
                          :length => { :maximum => 200 }
  validates :type, :presence => true
  validates :status, :presence => true
end
