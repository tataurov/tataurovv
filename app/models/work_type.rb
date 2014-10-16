class WorkType < ActiveRecord::Base
  attr_accessible :name, :description, :slug
  has_many :works
end
