class Work < ActiveRecord::Base
  has_many :work_types
  has_many :work_images

  attr_accessible :title, :description

  validates :title, presence: true
  validates :description, presence: true

end
