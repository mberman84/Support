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
    if voterships.create!(:issue_id => self.id, :user_id   => user_id,
                                                :direction => direction)
      flash[:success] = "Vote cast!"
    else
      flash[:error] = "Problem casting vote"
    end
  end
  
  def cancel_vote!(user_id)
    voterships.delete!(:issue_id => self.id, :user_id => user_id)
  end
end
