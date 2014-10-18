class Work < ActiveRecord::Base
  attr_accessible :title, :description, :images_attributes, :work_type_id

  has_many   :images, inverse_of: :work, dependent: :destroy
  belongs_to :work_type

  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true

  def self.with_images
    all.to_json(:include => :images)
  end

end
