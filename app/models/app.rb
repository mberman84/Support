class App < ActiveRecord::Base
  belongs_to :publisher
  has_many :issues
end
