class Work < ActiveRecord::Base
  has_many :work_types
  has_many :work_images


end
