class TwitterStream < ActiveRecord::Base

  acts_as_indexed :fields => [:username]

  validates :username, :presence => true, :uniqueness => true
  
end
