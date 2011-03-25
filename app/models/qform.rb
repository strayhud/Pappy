class Qform < ActiveRecord::Base
  validates :account, :presence => {:message => "can't be blank"}
  validates :opportunity, :presence => {:message => "can't be blank"}          
  validates :platforms, :presence => {:message => "must be specified"}          
end
