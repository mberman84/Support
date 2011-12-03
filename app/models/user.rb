class User < ActiveRecord::Base
  authenticates_with_sorcery!
  acts_as_api
  
  attr_accessible :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  has_many :comments
  has_many :voterships, :dependent => :destroy
  has_many :issues, :through => :voterships
  
  api_accessible :name_only do |template|
    template.add :name
  end
end
