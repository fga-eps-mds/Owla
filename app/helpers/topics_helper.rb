module TopicsHelper
  def get_image_dimensions image_path
    dimensions = Paperclip::Geometry.from_file(Topic.last.slide.path)
    return {
      width:  dimensions.width.to_i,
      height: dimensions.height.to_i
    }
  end
end
