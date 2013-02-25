module FurnishingsHelper


  def build_items_list(items, col_size=4)
    render :partial => "shared/item_list", :locals => { :items => items }
  end

  # expecting a string such as: "Height: 200cm;Width: 300cm;Depth: 200cm;Colour: red and orange"
  def dimensions_formatter(dimensions_str, sep="|")
    dimensions = dimensions_str.split(sep)
    render :partial=>'shared/dimension_list', :locals=>{ :dimensions=>dimensions }
  end

  def range_formatter(range)
    if !range.nil? && range.size > 0 then
      render :partial=>'shared/range_list', :locals=>{ :range=>range }
    end
  end


  def page_title(furnishing)
    name = " Furniture"
    name = ": #{furnishing.shape.capitalize}" unless furnishing.nil?
    "Balmain & Balmain - #{name}"
  end

end
