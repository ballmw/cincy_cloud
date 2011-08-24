class Buzz < ActiveRecord::Base

  acts_as_indexed :fields => [:search]

  validates :search, :presence => true, :uniqueness => true
  
end
