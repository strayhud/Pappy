class DemosystemController < ApplicationController
  def menu
    @presentations = Presentation.all
  end

end
