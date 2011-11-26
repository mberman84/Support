class App < ActiveRecord::Base
  belongs_to :publisher
  has_many :issues
  belongs_to :owner, class_name: "User"
  
  PLATFORM = ['iOS', 'Android']
  
  validates :name, :presence => true,
                   :length => { :maximum => 50 }
  validates :description, :presence => true,
                          :length => { :maximum => 200 }
  validates :version, :presence => true
  validates :platform, :presence => true
  
  def is_owner?(user)
    owner == user
  end
end
