class Issue < ActiveRecord::Base
  has_many :associations, :dependent => :destroy
  
  has_many :users, :through => :associations
  
  has_many :voterships, :dependent => :destroy
  has_many :users, :through => :voterships
  
  belongs_to :app
  
  STATUS = ['Open', 'Closed']
  
  validates :subject, :presence => true,
                      :length => { :maximum => 50 }
  validates :description, :presence => true,
                          :length => { :maximum => 200 }
  validates :type, :presence => true
  validates :status, :presence => true
  
  def cast_vote_up!(user_id, direction)
    voterships.create!(:issue_id => self.id, :user_id   => user_id,
                                                :direction => direction)
  end
  
  def cancel_vote!(user_id)
    voterships.find_by_user_id(user_id).destroy
  end
end
