class CmsPage < ActiveRecord::Base
  attr_accessible :name, :content

  validates :name, presence: true
  validates :content, presence: true

end
