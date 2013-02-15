# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def menu_item(name, path)
    if current_page?(path)
      content_tag(:li, :class => 'active') do
        name
      end 
    else
      content_tag(:li) do
        link_to(name, path)
      end 
    end
  end

  def page_name
    puts request.fullpath
    # request_uri = @controller.request
    # request_uri = request.request_uri.split('?').first
    # word = request_uri[/\w+$/]
    # ': ' + word.capitalize if word != nil
  end


  def img_name_determiner(filename, img_type=nil)
    filename.downcase!
    ext = File.extname(filename)
    base = File.basename(filename, ext)
    case
    when img_type == "thumb"
      return "#{base}-t#{ext}"

    when img_type == "zoom"
      return "#{base}-z#{ext}"

    when img_type == "dimensions"
      cat = base[/(^\w+)\-/, 1]
      return "#{cat}-dimensions#{ext}"

    when img_type == "dimensions-thumb"
      cat = base[/(^\w+)\-/, 1]
      return "#{cat}-dimensions-t#{ext}"

    else
      return filename
    end
  end


end
