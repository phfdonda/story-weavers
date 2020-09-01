class ImageUploader < Shrine
  plugin :pretty_location
  plugin :determine_mime_type
end
