class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  has_many :associations, :dependent => :destroy
  has_many :issues, :through => :associations
  
  has_many :voterships, :dependent => :destroy
  has_many :issues, :through => :voterships
end
