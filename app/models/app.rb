class App < ActiveRecord::Base
  belongs_to :publisher
  has_many :issues
  belongs_to :owner, class_name: "User"
end
