class Presentation < ActiveRecord::Base
  has_many :slides
  validates :name, :presence => true
  validates_uniqueness_of :name
end
