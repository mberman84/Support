class Issue < ActiveRecord::Base
  has_many :comments
  has_many :voterships, :dependent => :destroy
  has_many :users, :through => :voterships
  belongs_to :owner, class_name: "User"
  belongs_to :app
  
  STATUS = ['Open', 'Closed']
  
  validates :subject, :presence => true,
                      :length => { :maximum => 50 }
  validates :description, :presence => true,
                          :length => { :maximum => 200 }
  validates :status, :presence => true
  
  acts_as_api
  
  api_accessible :default do |template|
    template.add :subject
    template.add :description
    template.add :status
    template.add :created_at
    template.add :updated_at
    template.add :app_id
    template.add :owner_id
    template.add :comments
  end
  
  def cast_vote_up!(user_id, direction)
    voterships.create!(:issue_id => self.id, :user_id   => user_id,
                                                :direction => direction)
  end
  
  def cancel_vote!(user_id)
    voterships.find_by_user_id(user_id).destroy
  end
  
  def close_issue
    update_attributes(:status => "Closed")
  end
  
  def reopen_issue
    update_attributes(:status => "Open")
  end
  
  def is_owner?(user)
    owner == user
  end
end
