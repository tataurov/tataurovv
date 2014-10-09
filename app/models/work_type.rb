class WorkType < ActiveRecord::Base
  attr_accessible :name, :description, :slug
  has_and_belongs_to_many :works
end
