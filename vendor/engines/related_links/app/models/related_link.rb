class RelatedLink < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :href, :description]

  validates :name, :presence => true, :uniqueness => true
  
end
