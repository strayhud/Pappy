class Slide < ActiveRecord::Base
    attr_accessible :presentation_id, :image, :image_id, :presentation_name
    belongs_to :presentation
    has_attached_file :image, 
          :styles => { :thumb => "100x75", :small => "640x480", 
                       :medium => "800x600", :large => "1024x768"  },
          :path => ":rails_root/public/system/:attachment/:presentation_name/.:style/:filename",
          :url  => "/system/:attachment/:presentation_name/.:style/:filename"
end
