class WorkImage < ActiveRecord::Base
  belongs_to :work

  mount_uploader :image, WorkImageUploader
end
