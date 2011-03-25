class Slide < ActiveRecord::Base
    attr_accessible :presentation_id, :image, :image_id, :presentation_name
    belongs_to :presentation
    has_attached_file :image, 
          :styles => { :thumb => "100x75", :small => "320x240", 
                       :medium => "640x480", :large => "800x600"  },
          :path => ":rails_root/public/system/slides/:presentation_name/:style/:filename",
          :url  => "/system/slides/:presentation_name/:style/:filename"
    validates :name, :presence => {:message => "can't be blank"}
    validates :position, :presence => {:message => "must be specified"}          
end
