# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base


  include CarrierWave::MiniMagick

    process resize_to_fill: [400, 400]

    version :thumb do
    process resize_to_fill: [200,200]
  end


  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
