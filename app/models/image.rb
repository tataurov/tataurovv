class Image < ActiveRecord::Base
  attr_accessible :file, :title, :description, :work_id

  belongs_to :work
  mount_uploader :file, ImageUploader
end
