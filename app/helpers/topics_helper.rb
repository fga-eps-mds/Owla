module TopicsHelper
  def get_image_dimensions image
    dimensions = Paperclip::Geometry.from_file(image.path)
    return {
      width:  dimensions.width.to_i,
      height: dimensions.height.to_i
    }
  end

  def split_slide topic
    if topic.slide.present?
      begin
        Docsplit.extract_pages(topic.slide.path, output: slide_dir(topic))
      rescue => e
        flash[:alert] = "Sorry, the PDF file is corrupted."
        raise e #TODO catch this exception
      end
    end
  end

  def generate_slide_list topic
    if !dir_exists topic or !slide_splited? topic
      create_dir topic
      split_slide topic
    end

    list_of_files = Dir.entries(slide_dir(topic))
    pages = list_of_files.select { |f| /._\d+\.pdf/.match(f) }
    pages.map { |page_name| "#{root_path}slides/#{topic.id}/#{page_name}" }
  end

  def slide_splited? topic
    list_of_files = Dir.entries(slide_dir(topic))
    number_of_files = list_of_files.count
    return number_of_files > 1
  end

  def slide_dir topic
    return "#{Rails.public_path}/slides/#{topic.id}"
  end

  def create_dir topic
    Dir.mkdir(slide_dir(topic)) unless dir_exists(topic)
  end

  def dir_exists topic
    File.exists?(slide_dir(topic))
  end
end
