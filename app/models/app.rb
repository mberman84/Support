class App < ActiveRecord::Base
  belongs_to :publisher
  has_many :issues
  belongs_to :owner, class_name: "User"
  
  acts_as_api
  
  PLATFORM = ['iOS', 'Android']
  
  validates :name, :presence => true,
                   :length => { :maximum => 50 }
  validates :description, :presence => true,
                          :length => { :maximum => 200 }
  validates :version, :presence => true
  validates :platform, :presence => true
  
  api_accessible :default do |template|
    template.add :name
    template.add :description
    template.add :version
    template.add :platform
    template.add :created_at
    template.add :updated_at
    template.add :owner_id
    template.add :issues
  end
  
  def is_owner?(user)
    owner == user
  end
end
