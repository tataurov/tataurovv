class Image < ActiveRecord::Base
  attr_accessible :file, :title, :description, :work_id

  belongs_to :work

  validates :work, presence: true

  mount_uploader :file, ImageUploader
end
