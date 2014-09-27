class Work < ActiveRecord::Base
  attr_accessible :title, :description, :images_attributes

  #has_many :work_types
  has_many :images

  accepts_nested_attributes_for :images

  validates :title, presence: true
  validates :description, presence: true

end
