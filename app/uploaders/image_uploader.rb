# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_limit => [90, 90]
  end
  version :small do
    process :resize_to_limit => [250, 250]
  end
  version :big do
    process :resize_to_limit => [900, 900]
  end
  version :large do
    process :resize_to_limit => [2048, 2048]
  end
  version :croped do
    process :reprocess
  end

  def reprocess
    manipulate! do |img|
      x = model.crop_x.to_i
      y = model.crop_y.to_i
      w = model.crop_w.to_i
      h = model.crop_h.to_i
      img.crop(x.to_i, y.to_i, w.to_i, h.to_i, true)
    end
    resize_to_limit(300,300)
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
