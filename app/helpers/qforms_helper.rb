module QformsHelper
  def platform_included?(name_to_check,list_of_names)
    if (list_of_names.nil?)
      return false
    else
      return list_of_names.include? name_to_check
    end
  end
end
