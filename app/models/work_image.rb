class WorkImage < ActiveRecord::Base
  belongs_to :works

  mount_uploader :image, WorkImageUploader
end
