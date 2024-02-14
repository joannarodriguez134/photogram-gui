class PhotosController < ApplicationController
  
  def index
    @list_of_photos = Photo.all.order(:created_at => :desc)
   
    render(template: "photos_templates/index")
  end


end
