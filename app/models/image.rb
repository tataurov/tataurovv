class Image < ActiveRecord::Base
  attr_accessible :file, :title, :description, :work_id, :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  after_update :crop_image

  belongs_to :work

  validates :work, presence: true

  mount_uploader :file, ImageUploader

  def crop_image
    file.recreate_versions! if crop_x.present?
  end
end
