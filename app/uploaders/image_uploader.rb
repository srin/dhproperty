# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

    process resize_to_fill: [370, 370]

    version :thumb do
    process resize_to_fill: [200,200]
  end

  
  
    def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

  

end
